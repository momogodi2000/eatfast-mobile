/// Admin Statistics Model
class AdminStats {
  final int totalUsers;
  final int totalRestaurants;
  final int totalOrders;
  final double totalRevenue;
  final int activeOrders;
  final int pendingOrders;
  final double monthlyRevenue;
  final int newUsersThisMonth;
  final int newRestaurantsThisMonth;

  const AdminStats({
    required this.totalUsers,
    required this.totalRestaurants,
    required this.totalOrders,
    required this.totalRevenue,
    required this.activeOrders,
    required this.pendingOrders,
    required this.monthlyRevenue,
    required this.newUsersThisMonth,
    required this.newRestaurantsThisMonth,
  });

  factory AdminStats.empty() {
    return const AdminStats(
      totalUsers: 0,
      totalRestaurants: 0,
      totalOrders: 0,
      totalRevenue: 0.0,
      activeOrders: 0,
      pendingOrders: 0,
      monthlyRevenue: 0.0,
      newUsersThisMonth: 0,
      newRestaurantsThisMonth: 0,
    );
  }
}
