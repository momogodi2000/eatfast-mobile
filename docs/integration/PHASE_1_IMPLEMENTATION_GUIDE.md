# Phase 1 Implementation Guide - Critical Fixes

**Duration**: 2-3 weeks  
**Priority**: HIGH  
**Status**: 🚧 IN PROGRESS  
**Start Date**: Week of October 28, 2025

---

## 📋 Phase 1 Overview

### Objectives
1. ✅ Complete Driver Module (90% → 100%)
2. ✅ Set up Testing Infrastructure
3. ✅ Write Critical Path Tests
4. ✅ Fix Real-time Location Issues

### Success Criteria
- [ ] All Driver APIs implemented and tested
- [ ] Real-time location streaming optimized
- [ ] Test framework configured (Backend + Mobile)
- [ ] 50+ critical path tests written
- [ ] CI/CD pipeline operational

---

## Week 1-2: Driver Module Completion

### 🎯 Missing Features to Implement

#### 1. Real-time Location Streaming Optimization

**Current Issue**: Location updates use polling, need WebSocket streaming

**Backend Implementation** (`/src/services/driver/locationStreamingService.js`):

```javascript
const { Server } = require('socket.io');
const { Driver, Delivery } = require('../../models');
const logger = require('../../utils/logger');

class LocationStreamingService {
  constructor(io) {
    this.io = io;
    this.activeDrivers = new Map(); // driverId -> {socketId, location, lastUpdate}
  }

  /**
   * Initialize location streaming namespace
   */
  initializeNamespace() {
    const locationNamespace = this.io.of('/location-streaming');

    locationNamespace.use(async (socket, next) => {
      // Authenticate driver
      const token = socket.handshake.auth.token;
      if (!token) {
        return next(new Error('Authentication required'));
      }

      try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        if (decoded.role !== 'delivery_agent') {
          return next(new Error('Invalid role'));
        }

        socket.driverId = decoded.id;
        next();
      } catch (error) {
        next(new Error('Invalid token'));
      }
    });

    locationNamespace.on('connection', (socket) => {
      const driverId = socket.driverId;
      logger.info('Driver connected to location streaming', { driverId });

      // Store active driver
      this.activeDrivers.set(driverId, {
        socketId: socket.id,
        location: null,
        lastUpdate: new Date()
      });

      // Handle location updates
      socket.on('location:update', async (data) => {
        await this.handleLocationUpdate(driverId, data);
      });

      // Handle driver going offline
      socket.on('disconnect', () => {
        this.handleDriverDisconnect(driverId);
      });
    });
  }

  /**
   * Handle location update from driver
   */
  async handleLocationUpdate(driverId, locationData) {
    try {
      const { latitude, longitude, heading, speed, accuracy } = locationData;

      // Validate location data
      if (!this.isValidLocation(latitude, longitude)) {
        logger.warn('Invalid location data', { driverId, locationData });
        return;
      }

      // Update driver location in database
      await Driver.update(
        {
          current_location: {
            type: 'Point',
            coordinates: [longitude, latitude]
          },
          last_location_update: new Date()
        },
        { where: { id: driverId } }
      );

      // Update active drivers map
      const driverInfo = this.activeDrivers.get(driverId);
      if (driverInfo) {
        driverInfo.location = { latitude, longitude, heading, speed, accuracy };
        driverInfo.lastUpdate = new Date();
      }

      // Broadcast to customers tracking this driver's deliveries
      await this.broadcastToTrackingCustomers(driverId, locationData);

      // Check for delivery milestones (near restaurant, near customer)
      await this.checkDeliveryMilestones(driverId, { latitude, longitude });

    } catch (error) {
      logger.error('Location update failed', { driverId, error: error.message });
    }
  }

  /**
   * Broadcast location to customers tracking active deliveries
   */
  async broadcastToTrackingCustomers(driverId, locationData) {
    try {
      // Find active deliveries for this driver
      const activeDeliveries = await Delivery.findAll({
        where: {
          driver_id: driverId,
          status: ['picked_up', 'in_transit']
        },
        include: ['order']
      });

      // Emit location to each customer
      for (const delivery of activeDeliveries) {
        const customerId = delivery.order.customer_id;
        
        this.io.of('/order-tracking').to(`customer-${customerId}`).emit('driver:location_update', {
          orderId: delivery.order_id,
          driverId,
          location: locationData,
          estimatedArrival: this.calculateETA(locationData, delivery.order.delivery_address)
        });
      }

    } catch (error) {
      logger.error('Failed to broadcast location', { driverId, error: error.message });
    }
  }

  /**
   * Check if driver has reached important milestones
   */
  async checkDeliveryMilestones(driverId, currentLocation) {
    const activeDeliveries = await Delivery.findAll({
      where: { driver_id: driverId, status: ['assigned', 'picked_up'] }
    });

    for (const delivery of activeDeliveries) {
      // Check if near restaurant (for pickup)
      if (delivery.status === 'assigned') {
        const distanceToRestaurant = this.calculateDistance(
          currentLocation,
          delivery.restaurant_location
        );

        if (distanceToRestaurant < 0.1) { // Within 100 meters
          await this.notifyNearRestaurant(delivery);
        }
      }

      // Check if near customer (for delivery)
      if (delivery.status === 'picked_up') {
        const distanceToCustomer = this.calculateDistance(
          currentLocation,
          delivery.delivery_location
        );

        if (distanceToCustomer < 0.1) { // Within 100 meters
          await this.notifyNearCustomer(delivery);
        }
      }
    }
  }

  /**
   * Calculate distance between two coordinates (in km)
   */
  calculateDistance(point1, point2) {
    const R = 6371; // Earth's radius in km
    const dLat = this.toRad(point2.latitude - point1.latitude);
    const dLon = this.toRad(point2.longitude - point1.longitude);
    
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
              Math.cos(this.toRad(point1.latitude)) * Math.cos(this.toRad(point2.latitude)) *
              Math.sin(dLon / 2) * Math.sin(dLon / 2);
    
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  }

  toRad(degrees) {
    return degrees * (Math.PI / 180);
  }

  /**
   * Calculate estimated time of arrival
   */
  calculateETA(currentLocation, destinationAddress) {
    const distance = this.calculateDistance(currentLocation, destinationAddress.coordinates);
    const averageSpeed = 30; // km/h in city traffic
    const minutes = Math.ceil((distance / averageSpeed) * 60);
    
    return {
      minutes,
      timestamp: new Date(Date.now() + minutes * 60000)
    };
  }

  /**
   * Validate location coordinates
   */
  isValidLocation(lat, lng) {
    return lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;
  }

  /**
   * Handle driver disconnect
   */
  handleDriverDisconnect(driverId) {
    logger.info('Driver disconnected from location streaming', { driverId });
    this.activeDrivers.delete(driverId);
  }

  /**
   * Get active drivers count
   */
  getActiveDriversCount() {
    return this.activeDrivers.size;
  }

  /**
   * Get driver's last known location
   */
  getDriverLocation(driverId) {
    const driverInfo = this.activeDrivers.get(driverId);
    return driverInfo ? driverInfo.location : null;
  }

  /**
   * Notify driver is near restaurant
   */
  async notifyNearRestaurant(delivery) {
    this.io.of('/driver-notifications').to(`driver-${delivery.driver_id}`).emit('milestone:near_restaurant', {
      deliveryId: delivery.id,
      restaurantName: delivery.restaurant.name,
      message: 'You are approaching the restaurant'
    });
  }

  /**
   * Notify driver is near customer
   */
  async notifyNearCustomer(delivery) {
    this.io.of('/driver-notifications').to(`driver-${delivery.driver_id}`).emit('milestone:near_customer', {
      deliveryId: delivery.id,
      customerName: delivery.order.customer.first_name,
      message: 'You are approaching the delivery location'
    });

    // Notify customer
    this.io.of('/order-tracking').to(`customer-${delivery.order.customer_id}`).emit('driver:arriving', {
      orderId: delivery.order_id,
      estimatedArrival: 2 // 2 minutes
    });
  }
}

module.exports = LocationStreamingService;
```

**Initialize in Server** (`/src/server.js`):

```javascript
// Add after Socket.IO initialization
const LocationStreamingService = require('./services/driver/locationStreamingService');
const locationService = new LocationStreamingService(io);
locationService.initializeNamespace();

logger.info('Location streaming service initialized');
```

---

#### 2. Driver Statistics Endpoint

**Backend Route** (`/src/routes/driver/index.js`):

```javascript
// Add new route
router.get('/statistics/detailed', authenticate, driverController.getDetailedStatistics);
```

**Controller** (`/src/controllers/driver/driverController.js`):

```javascript
/**
 * Get detailed driver statistics
 */
exports.getDetailedStatistics = async (req, res) => {
  try {
    const driverId = req.user.id;
    const { period = '30d' } = req.query; // 7d, 30d, 90d, 1y

    const periodDays = {
      '7d': 7,
      '30d': 30,
      '90d': 90,
      '1y': 365
    };

    const days = periodDays[period] || 30;
    const startDate = new Date();
    startDate.setDate(startDate.getDate() - days);

    // Get deliveries in period
    const deliveries = await Delivery.findAll({
      where: {
        driver_id: driverId,
        created_at: { [Op.gte]: startDate }
      },
      include: ['order', 'review']
    });

    // Calculate statistics
    const stats = {
      period: {
        days,
        startDate,
        endDate: new Date()
      },
      deliveries: {
        total: deliveries.length,
        completed: deliveries.filter(d => d.status === 'delivered').length,
        cancelled: deliveries.filter(d => d.status === 'cancelled').length,
        averagePerDay: (deliveries.length / days).toFixed(2)
      },
      earnings: {
        total: deliveries.reduce((sum, d) => sum + (d.driver_fee || 0), 0),
        deliveryFees: deliveries.reduce((sum, d) => sum + (d.base_fee || 0), 0),
        tips: deliveries.reduce((sum, d) => sum + (d.tip_amount || 0), 0),
        bonuses: deliveries.reduce((sum, d) => sum + (d.bonus_amount || 0), 0),
        averagePerDelivery: deliveries.length > 0 
          ? (deliveries.reduce((sum, d) => sum + (d.driver_fee || 0), 0) / deliveries.length).toFixed(2)
          : 0
      },
      performance: {
        rating: {
          average: this.calculateAverageRating(deliveries),
          total: deliveries.filter(d => d.review).length,
          distribution: this.getRatingDistribution(deliveries)
        },
        onTimeRate: this.calculateOnTimeRate(deliveries),
        acceptanceRate: this.calculateAcceptanceRate(driverId, days),
        completionRate: deliveries.length > 0 
          ? ((deliveries.filter(d => d.status === 'delivered').length / deliveries.length) * 100).toFixed(2)
          : 0
      },
      efficiency: {
        averageDeliveryTime: this.calculateAverageDeliveryTime(deliveries),
        averageDistance: this.calculateAverageDistance(deliveries),
        peakHours: this.calculatePeakHours(deliveries),
        bestDays: this.calculateBestDays(deliveries)
      },
      breakdown: {
        byWeek: this.groupByWeek(deliveries),
        byDay: this.groupByDay(deliveries),
        byHour: this.groupByHour(deliveries)
      }
    };

    res.json({
      success: true,
      data: { statistics: stats }
    });

  } catch (error) {
    logger.error('Failed to get driver statistics', { error: error.message });
    res.status(500).json({
      success: false,
      error: 'Failed to retrieve statistics'
    });
  }
};

// Helper methods
exports.calculateAverageRating = (deliveries) => {
  const ratings = deliveries.filter(d => d.review).map(d => d.review.driver_rating);
  if (ratings.length === 0) return 0;
  return (ratings.reduce((sum, r) => sum + r, 0) / ratings.length).toFixed(2);
};

exports.getRatingDistribution = (deliveries) => {
  const distribution = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 };
  deliveries.forEach(d => {
    if (d.review && d.review.driver_rating) {
      distribution[d.review.driver_rating]++;
    }
  });
  return distribution;
};

exports.calculateOnTimeRate = (deliveries) => {
  const completed = deliveries.filter(d => d.status === 'delivered');
  if (completed.length === 0) return 0;
  
  const onTime = completed.filter(d => {
    const estimatedTime = new Date(d.estimated_delivery_time);
    const actualTime = new Date(d.delivered_at);
    return actualTime <= estimatedTime;
  });
  
  return ((onTime.length / completed.length) * 100).toFixed(2);
};

exports.calculateAcceptanceRate = async (driverId, days) => {
  const startDate = new Date();
  startDate.setDate(startDate.getDate() - days);
  
  // This would need a delivery_assignments table to track offers
  // For now, return placeholder
  return 95; // Placeholder
};

exports.calculateAverageDeliveryTime = (deliveries) => {
  const completed = deliveries.filter(d => d.status === 'delivered');
  if (completed.length === 0) return 0;
  
  const totalMinutes = completed.reduce((sum, d) => {
    const pickupTime = new Date(d.picked_up_at);
    const deliveryTime = new Date(d.delivered_at);
    return sum + ((deliveryTime - pickupTime) / 60000);
  }, 0);
  
  return Math.round(totalMinutes / completed.length);
};

exports.calculateAverageDistance = (deliveries) => {
  const completed = deliveries.filter(d => d.status === 'delivered' && d.distance);
  if (completed.length === 0) return 0;
  
  const totalDistance = completed.reduce((sum, d) => sum + d.distance, 0);
  return (totalDistance / completed.length).toFixed(2);
};

exports.calculatePeakHours = (deliveries) => {
  const hourCounts = {};
  
  deliveries.forEach(d => {
    const hour = new Date(d.created_at).getHours();
    hourCounts[hour] = (hourCounts[hour] || 0) + 1;
  });
  
  return Object.entries(hourCounts)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 3)
    .map(([hour, count]) => ({ hour: parseInt(hour), deliveries: count }));
};

exports.calculateBestDays = (deliveries) => {
  const dayCounts = {};
  
  deliveries.forEach(d => {
    const day = new Date(d.created_at).toLocaleDateString('en-US', { weekday: 'long' });
    dayCounts[day] = (dayCounts[day] || 0) + (d.driver_fee || 0);
  });
  
  return Object.entries(dayCounts)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 3)
    .map(([day, earnings]) => ({ day, earnings }));
};

exports.groupByWeek = (deliveries) => {
  const weeks = {};
  
  deliveries.forEach(d => {
    const date = new Date(d.created_at);
    const weekNumber = this.getWeekNumber(date);
    const key = `Week ${weekNumber}`;
    
    if (!weeks[key]) {
      weeks[key] = { deliveries: 0, earnings: 0 };
    }
    
    weeks[key].deliveries++;
    weeks[key].earnings += d.driver_fee || 0;
  });
  
  return weeks;
};

exports.groupByDay = (deliveries) => {
  const days = {};
  
  deliveries.forEach(d => {
    const date = new Date(d.created_at).toLocaleDateString();
    
    if (!days[date]) {
      days[date] = { deliveries: 0, earnings: 0 };
    }
    
    days[date].deliveries++;
    days[date].earnings += d.driver_fee || 0;
  });
  
  return days;
};

exports.groupByHour = (deliveries) => {
  const hours = {};
  
  for (let i = 0; i < 24; i++) {
    hours[i] = { deliveries: 0, earnings: 0 };
  }
  
  deliveries.forEach(d => {
    const hour = new Date(d.created_at).getHours();
    hours[hour].deliveries++;
    hours[hour].earnings += d.driver_fee || 0;
  });
  
  return hours;
};

exports.getWeekNumber = (date) => {
  const firstDayOfYear = new Date(date.getFullYear(), 0, 1);
  const pastDaysOfYear = (date - firstDayOfYear) / 86400000;
  return Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7);
};
```

---

#### 3. Advanced Earnings Reports

**Backend Route** (`/src/routes/driver/index.js`):

```javascript
router.get('/earnings/breakdown', authenticate, driverController.getEarningsBreakdown);
router.get('/earnings/export', authenticate, driverController.exportEarnings);
```

**Controller** (`/src/controllers/driver/driverController.js`):

```javascript
/**
 * Get detailed earnings breakdown
 */
exports.getEarningsBreakdown = async (req, res) => {
  try {
    const driverId = req.user.id;
    const { startDate, endDate, groupBy = 'day' } = req.query;

    const where = {
      driver_id: driverId,
      status: 'delivered'
    };

    if (startDate) {
      where.delivered_at = { [Op.gte]: new Date(startDate) };
    }
    if (endDate) {
      where.delivered_at = { 
        ...where.delivered_at,
        [Op.lte]: new Date(endDate) 
      };
    }

    const deliveries = await Delivery.findAll({
      where,
      include: ['order'],
      order: [['delivered_at', 'ASC']]
    });

    const breakdown = {
      summary: {
        totalEarnings: 0,
        totalDeliveries: deliveries.length,
        baseFees: 0,
        distanceFees: 0,
        tips: 0,
        bonuses: 0,
        peakHourBonus: 0,
        referralBonus: 0
      },
      groupedData: this.groupEarnings(deliveries, groupBy),
      paymentStatus: {
        paid: await this.getPaidAmount(driverId, startDate, endDate),
        pending: await this.getPendingAmount(driverId),
        upcoming: await this.getUpcomingPayouts(driverId)
      },
      taxes: {
        estimatedTaxable: 0, // Calculate based on earnings
        deductions: 0,
        netEarnings: 0
      }
    };

    // Calculate totals
    deliveries.forEach(d => {
      breakdown.summary.baseFees += d.base_fee || 0;
      breakdown.summary.distanceFees += d.distance_fee || 0;
      breakdown.summary.tips += d.tip_amount || 0;
      breakdown.summary.bonuses += d.bonus_amount || 0;
      breakdown.summary.peakHourBonus += d.peak_hour_bonus || 0;
      breakdown.summary.totalEarnings += d.driver_fee || 0;
    });

    breakdown.taxes.estimatedTaxable = breakdown.summary.totalEarnings;
    breakdown.taxes.netEarnings = breakdown.summary.totalEarnings;

    res.json({
      success: true,
      data: { earnings: breakdown }
    });

  } catch (error) {
    logger.error('Failed to get earnings breakdown', { error: error.message });
    res.status(500).json({
      success: false,
      error: 'Failed to retrieve earnings breakdown'
    });
  }
};

exports.groupEarnings = (deliveries, groupBy) => {
  const grouped = {};
  
  deliveries.forEach(d => {
    let key;
    const date = new Date(d.delivered_at);
    
    switch (groupBy) {
      case 'hour':
        key = date.toISOString().slice(0, 13);
        break;
      case 'day':
        key = date.toISOString().slice(0, 10);
        break;
      case 'week':
        key = `Week ${this.getWeekNumber(date)}-${date.getFullYear()}`;
        break;
      case 'month':
        key = date.toISOString().slice(0, 7);
        break;
      default:
        key = date.toISOString().slice(0, 10);
    }
    
    if (!grouped[key]) {
      grouped[key] = {
        deliveries: 0,
        earnings: 0,
        tips: 0,
        bonuses: 0
      };
    }
    
    grouped[key].deliveries++;
    grouped[key].earnings += d.driver_fee || 0;
    grouped[key].tips += d.tip_amount || 0;
    grouped[key].bonuses += d.bonus_amount || 0;
  });
  
  return grouped;
};

exports.getPaidAmount = async (driverId, startDate, endDate) => {
  const where = { driver_id: driverId, status: 'paid' };
  if (startDate) where.paid_at = { [Op.gte]: new Date(startDate) };
  if (endDate) where.paid_at = { ...where.paid_at, [Op.lte]: new Date(endDate) };
  
  const payouts = await DriverPayout.findAll({ where });
  return payouts.reduce((sum, p) => sum + p.amount, 0);
};

exports.getPendingAmount = async (driverId) => {
  const pendingDeliveries = await Delivery.sum('driver_fee', {
    where: {
      driver_id: driverId,
      status: 'delivered',
      paid_to_driver: false
    }
  });
  
  return pendingDeliveries || 0;
};

exports.getUpcomingPayouts = async (driverId) => {
  // Get scheduled payouts
  const upcomingPayouts = await DriverPayout.findAll({
    where: {
      driver_id: driverId,
      status: 'scheduled'
    },
    order: [['scheduled_date', 'ASC']]
  });
  
  return upcomingPayouts.map(p => ({
    amount: p.amount,
    scheduledDate: p.scheduled_date,
    method: p.payment_method
  }));
};

/**
 * Export earnings to CSV/PDF
 */
exports.exportEarnings = async (req, res) => {
  try {
    const driverId = req.user.id;
    const { format = 'csv', startDate, endDate } = req.query;

    // Get deliveries
    const deliveries = await this.getDeliveriesForExport(driverId, startDate, endDate);

    if (format === 'csv') {
      const csv = this.generateCSV(deliveries);
      res.setHeader('Content-Type', 'text/csv');
      res.setHeader('Content-Disposition', `attachment; filename=earnings-${Date.now()}.csv`);
      res.send(csv);
    } else if (format === 'pdf') {
      const pdf = await this.generatePDF(deliveries, driverId);
      res.setHeader('Content-Type', 'application/pdf');
      res.setHeader('Content-Disposition', `attachment; filename=earnings-${Date.now()}.pdf`);
      res.send(pdf);
    } else {
      res.status(400).json({
        success: false,
        error: 'Invalid format. Use csv or pdf'
      });
    }

  } catch (error) {
    logger.error('Failed to export earnings', { error: error.message });
    res.status(500).json({
      success: false,
      error: 'Failed to export earnings'
    });
  }
};

exports.generateCSV = (deliveries) => {
  const headers = ['Date', 'Order ID', 'Restaurant', 'Customer', 'Base Fee', 'Distance Fee', 'Tip', 'Bonus', 'Total'];
  const rows = deliveries.map(d => [
    new Date(d.delivered_at).toLocaleDateString(),
    d.order.order_number,
    d.order.restaurant.name,
    d.order.customer.first_name,
    d.base_fee || 0,
    d.distance_fee || 0,
    d.tip_amount || 0,
    d.bonus_amount || 0,
    d.driver_fee || 0
  ]);
  
  return [headers, ...rows].map(row => row.join(',')).join('\n');
};
```

---

#### 4. Shift Management System

**Database Migration** (`/src/migrations/YYYYMMDDHHMMSS-create-driver-shifts.js`):

```javascript
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('driver_shifts', {
      id: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        primaryKey: true
      },
      driver_id: {
        type: Sequelize.UUID,
        allowNull: false,
        references: {
          model: 'users',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      start_time: {
        type: Sequelize.DATE,
        allowNull: false
      },
      end_time: {
        type: Sequelize.DATE,
        allowNull: true
      },
      status: {
        type: Sequelize.ENUM('active', 'completed', 'cancelled'),
        defaultValue: 'active'
      },
      start_location: {
        type: Sequelize.GEOMETRY('POINT'),
        allowNull: true
      },
      end_location: {
        type: Sequelize.GEOMETRY('POINT'),
        allowNull: true
      },
      total_deliveries: {
        type: Sequelize.INTEGER,
        defaultValue: 0
      },
      total_earnings: {
        type: Sequelize.DECIMAL(10, 2),
        defaultValue: 0.00
      },
      total_distance: {
        type: Sequelize.DECIMAL(10, 2),
        defaultValue: 0.00
      },
      notes: {
        type: Sequelize.TEXT,
        allowNull: true
      },
      created_at: {
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW
      },
      updated_at: {
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW
      }
    });

    await queryInterface.addIndex('driver_shifts', ['driver_id']);
    await queryInterface.addIndex('driver_shifts', ['status']);
    await queryInterface.addIndex('driver_shifts', ['start_time']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('driver_shifts');
  }
};
```

**Model** (`/src/models/driver/shift.js`):

```javascript
const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  const DriverShift = sequelize.define('DriverShift', {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true
    },
    driver_id: {
      type: DataTypes.UUID,
      allowNull: false
    },
    start_time: {
      type: DataTypes.DATE,
      allowNull: false
    },
    end_time: {
      type: DataTypes.DATE,
      allowNull: true
    },
    status: {
      type: DataTypes.ENUM('active', 'completed', 'cancelled'),
      defaultValue: 'active'
    },
    start_location: {
      type: DataTypes.GEOMETRY('POINT'),
      allowNull: true
    },
    end_location: {
      type: DataTypes.GEOMETRY('POINT'),
      allowNull: true
    },
    total_deliveries: {
      type: DataTypes.INTEGER,
      defaultValue: 0
    },
    total_earnings: {
      type: DataTypes.DECIMAL(10, 2),
      defaultValue: 0.00
    },
    total_distance: {
      type: DataTypes.DECIMAL(10, 2),
      defaultValue: 0.00
    },
    notes: {
      type: DataTypes.TEXT,
      allowNull: true
    }
  }, {
    tableName: 'driver_shifts',
    underscored: true,
    timestamps: true
  });

  DriverShift.associate = (models) => {
    DriverShift.belongsTo(models.User, {
      foreignKey: 'driver_id',
      as: 'driver'
    });
  };

  return DriverShift;
};
```

**Routes** (`/src/routes/driver/index.js`):

```javascript
// Shift management routes
router.post('/shift/start', authenticate, driverController.startShift);
router.post('/shift/end', authenticate, driverController.endShift);
router.get('/shift/current', authenticate, driverController.getCurrentShift);
router.get('/shift/history', authenticate, driverController.getShiftHistory);
```

**Controller Methods** (`/src/controllers/driver/driverController.js`):

```javascript
/**
 * Start a new shift
 */
exports.startShift = async (req, res) => {
  try {
    const driverId = req.user.id;
    const { latitude, longitude } = req.body;

    // Check if driver already has an active shift
    const activeShift = await DriverShift.findOne({
      where: {
        driver_id: driverId,
        status: 'active'
      }
    });

    if (activeShift) {
      return res.status(400).json({
        success: false,
        error: 'You already have an active shift. Please end it before starting a new one.'
      });
    }

    // Create new shift
    const shift = await DriverShift.create({
      driver_id: driverId,
      start_time: new Date(),
      status: 'active',
      start_location: latitude && longitude ? {
        type: 'Point',
        coordinates: [longitude, latitude]
      } : null
    });

    // Update driver availability
    await User.update(
      { 
        is_available: true,
        current_shift_id: shift.id
      },
      { where: { id: driverId } }
    );

    logger.info('Driver shift started', { driverId, shiftId: shift.id });

    res.status(201).json({
      success: true,
      message: 'Shift started successfully',
      data: {
        shift: {
          id: shift.id,
          startTime: shift.start_time,
          status: shift.status
        }
      }
    });

  } catch (error) {
    logger.error('Failed to start shift', { error: error.message });
    res.status(500).json({
      success: false,
      error: 'Failed to start shift'
    });
  }
};

/**
 * End current shift
 */
exports.endShift = async (req, res) => {
  try {
    const driverId = req.user.id;
    const { latitude, longitude, notes } = req.body;

    // Get active shift
    const shift = await DriverShift.findOne({
      where: {
        driver_id: driverId,
        status: 'active'
      }
    });

    if (!shift) {
      return res.status(404).json({
        success: false,
        error: 'No active shift found'
      });
    }

    // Calculate shift statistics
    const deliveries = await Delivery.findAll({
      where: {
        driver_id: driverId,
        created_at: {
          [Op.gte]: shift.start_time
        },
        status: 'delivered'
      }
    });

    const totalEarnings = deliveries.reduce((sum, d) => sum + (d.driver_fee || 0), 0);
    const totalDistance = deliveries.reduce((sum, d) => sum + (d.distance || 0), 0);

    // Update shift
    await shift.update({
      end_time: new Date(),
      status: 'completed',
      end_location: latitude && longitude ? {
        type: 'Point',
        coordinates: [longitude, latitude]
      } : null,
      total_deliveries: deliveries.length,
      total_earnings: totalEarnings,
      total_distance: totalDistance,
      notes
    });

    // Update driver availability
    await User.update(
      { 
        is_available: false,
        current_shift_id: null
      },
      { where: { id: driverId } }
    );

    logger.info('Driver shift ended', { 
      driverId, 
      shiftId: shift.id,
      totalDeliveries: deliveries.length,
      totalEarnings
    });

    res.json({
      success: true,
      message: 'Shift ended successfully',
      data: {
        shift: {
          id: shift.id,
          startTime: shift.start_time,
          endTime: shift.end_time,
          duration: (new Date(shift.end_time) - new Date(shift.start_time)) / 3600000, // hours
          totalDeliveries: deliveries.length,
          totalEarnings,
          totalDistance,
          status: shift.status
        }
      }
    });

  } catch (error) {
    logger.error('Failed to end shift', { error: error.message });
    res.status(500).json({
      success: false,
      error: 'Failed to end shift'
    });
  }
};

/**
 * Get current active shift
 */
exports.getCurrentShift = async (req, res) => {
  try {
    const driverId = req.user.id;

    const shift = await DriverShift.findOne({
      where: {
        driver_id: driverId,
        status: 'active'
      }
    });

    if (!shift) {
      return res.json({
        success: true,
        data: {
          activeShift: null,
          message: 'No active shift'
        }
      });
    }

    // Get current shift statistics
    const deliveries = await Delivery.count({
      where: {
        driver_id: driverId,
        created_at: {
          [Op.gte]: shift.start_time
        },
        status: 'delivered'
      }
    });

    const earnings = await Delivery.sum('driver_fee', {
      where: {
        driver_id: driverId,
        created_at: {
          [Op.gte]: shift.start_time
        },
        status: 'delivered'
      }
    });

    const duration = (new Date() - new Date(shift.start_time)) / 3600000; // hours

    res.json({
      success: true,
      data: {
        activeShift: {
          id: shift.id,
          startTime: shift.start_time,
          duration: duration.toFixed(2),
          deliveries,
          earnings: earnings || 0,
          status: shift.status
        }
      }
    });

  } catch (error) {
    logger.error('Failed to get current shift', { error: error.message });
    res.status(500).json({
      success: false,
      error: 'Failed to retrieve current shift'
    });
  }
};

/**
 * Get shift history
 */
exports.getShiftHistory = async (req, res) => {
  try {
    const driverId = req.user.id;
    const { page = 1, limit = 20, status } = req.query;

    const where = { driver_id: driverId };
    if (status) where.status = status;

    const shifts = await DriverShift.findAndCountAll({
      where,
      order: [['start_time', 'DESC']],
      limit: parseInt(limit),
      offset: (parseInt(page) - 1) * parseInt(limit)
    });

    res.json({
      success: true,
      data: {
        shifts: shifts.rows.map(s => ({
          id: s.id,
          startTime: s.start_time,
          endTime: s.end_time,
          duration: s.end_time 
            ? ((new Date(s.end_time) - new Date(s.start_time)) / 3600000).toFixed(2)
            : null,
          totalDeliveries: s.total_deliveries,
          totalEarnings: s.total_earnings,
          totalDistance: s.total_distance,
          status: s.status
        })),
        pagination: {
          total: shifts.count,
          page: parseInt(page),
          limit: parseInt(limit),
          totalPages: Math.ceil(shifts.count / parseInt(limit))
        }
      }
    });

  } catch (error) {
    logger.error('Failed to get shift history', { error: error.message });
    res.status(500).json({
      success: false,
      error: 'Failed to retrieve shift history'
    });
  }
};
```

---

*This is Part 1 of Phase 1. Continuing with Flutter implementation and testing setup...*

---

**[Continue to Part 2: Flutter Implementation →](PHASE_1_PART_2_FLUTTER.md)**


