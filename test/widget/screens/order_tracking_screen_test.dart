import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Order Tracking Screen Widget Tests', () {
    testWidgets('should display order status header', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                key: const Key('tracking_app_bar'),
                title: const Text('Track Order'),
                actions: [
                  IconButton(
                    key: const Key('help_button'),
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {},
                  ),
                ],
              ),
              body: Column(
                children: [
                  Container(
                    key: const Key('order_status_header'),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'Order #EF12345',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'In Transit',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Estimated arrival: 10-15 minutes',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('tracking_app_bar')), findsOneWidget);
      expect(find.text('Track Order'), findsOneWidget);
      expect(find.byKey(const Key('help_button')), findsOneWidget);
      expect(find.byKey(const Key('order_status_header')), findsOneWidget);
      expect(find.text('Order #EF12345'), findsOneWidget);
      expect(find.text('In Transit'), findsOneWidget);
      expect(find.text('Estimated arrival: 10-15 minutes'), findsOneWidget);
    });

    testWidgets('should display order progress timeline', (WidgetTester tester) async {
      // Arrange
      final orderSteps = [
        {'title': 'Order Placed', 'time': '2:30 PM', 'completed': true},
        {'title': 'Order Confirmed', 'time': '2:32 PM', 'completed': true},
        {'title': 'Preparing Order', 'time': '2:35 PM', 'completed': true},
        {'title': 'Out for Delivery', 'time': '2:50 PM', 'completed': true},
        {'title': 'Delivered', 'time': 'Est. 3:05 PM', 'completed': false},
      ];

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Progress',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      key: const Key('order_timeline'),
                      children: orderSteps.asMap().entries.map((entry) {
                        final index = entry.key;
                        final step = entry.value;
                        final isCompleted = step['completed'] as bool;
                        final isLast = index == orderSteps.length - 1;

                        return Row(
                          key: Key('timeline_step_$index'),
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: isCompleted ? Colors.green : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: isCompleted
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12,
                                        )
                                      : null,
                                ),
                                if (!isLast)
                                  Container(
                                    width: 2,
                                    height: 40,
                                    color: isCompleted ? Colors.green : Colors.grey,
                                  ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 32),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      step['title'] as String,
                                      style: TextStyle(
                                        fontWeight: isCompleted
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isCompleted ? Colors.black : Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      step['time'] as String,
                                      style: TextStyle(
                                        color: isCompleted ? Colors.green : Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Order Progress'), findsOneWidget);
      expect(find.byKey(const Key('order_timeline')), findsOneWidget);
      expect(find.byKey(const Key('timeline_step_0')), findsOneWidget);
      expect(find.text('Order Placed'), findsOneWidget);
      expect(find.text('2:30 PM'), findsOneWidget);
      expect(find.text('Order Confirmed'), findsOneWidget);
      expect(find.text('Preparing Order'), findsOneWidget);
      expect(find.text('Out for Delivery'), findsOneWidget);
      expect(find.text('Delivered'), findsOneWidget);
    });

    testWidgets('should display delivery driver information', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('driver_info_card'),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      key: const Key('driver_avatar'),
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mike Johnson',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Delivery Driver'),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Text('4.8 • Honda Civic • ABC-123'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          key: Key('call_driver_button'),
                          onPressed: null,
                          icon: Icon(Icons.phone, color: Colors.green),
                        ),
                        IconButton(
                          key: Key('message_driver_button'),
                          onPressed: null,
                          icon: Icon(Icons.message, color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('driver_info_card')), findsOneWidget);
      expect(find.byKey(const Key('driver_avatar')), findsOneWidget);
      expect(find.text('Mike Johnson'), findsOneWidget);
      expect(find.text('Delivery Driver'), findsOneWidget);
      expect(find.text('4.8 • Honda Civic • ABC-123'), findsOneWidget);
      expect(find.byKey(const Key('call_driver_button')), findsOneWidget);
      expect(find.byKey(const Key('message_driver_button')), findsOneWidget);
    });

    testWidgets('should display live tracking map', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  Container(
                    key: const Key('tracking_map'),
                    height: 300,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.map, size: 60, color: Colors.grey),
                              Text('Live Tracking Map'),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Column(
                            children: [
                              FloatingActionButton.small(
                                key: const Key('zoom_in_button'),
                                onPressed: () {},
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(height: 8),
                              FloatingActionButton.small(
                                key: const Key('zoom_out_button'),
                                onPressed: () {},
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(height: 8),
                              FloatingActionButton.small(
                                key: const Key('my_location_button'),
                                onPressed: () {},
                                child: const Icon(Icons.my_location),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('tracking_map')), findsOneWidget);
      expect(find.text('Live Tracking Map'), findsOneWidget);
      expect(find.byKey(const Key('zoom_in_button')), findsOneWidget);
      expect(find.byKey(const Key('zoom_out_button')), findsOneWidget);
      expect(find.byKey(const Key('my_location_button')), findsOneWidget);
    });

    testWidgets('should display order items summary', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('order_items_summary'),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pizza Palace',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          key: const Key('view_receipt_button'),
                          onPressed: () {},
                          child: const Text('View Receipt'),
                        ),
                      ],
                    ),
                    const Divider(),
                    const Text('2x Margherita Pizza'),
                    const Text('1x Caesar Salad'),
                    const Text('1x Garlic Bread'),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text(
                          '\$34.48',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('order_items_summary')), findsOneWidget);
      expect(find.text('Pizza Palace'), findsOneWidget);
      expect(find.byKey(const Key('view_receipt_button')), findsOneWidget);
      expect(find.text('2x Margherita Pizza'), findsOneWidget);
      expect(find.text('1x Caesar Salad'), findsOneWidget);
      expect(find.text('1x Garlic Bread'), findsOneWidget);
      expect(find.text('Total'), findsOneWidget);
      expect(find.text('\$34.48'), findsOneWidget);
    });

    testWidgets('should display delivery address', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('delivery_address_card'),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.green),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text('123 Main Street, Apt 4B'),
                          Text('New York, NY 10001'),
                        ],
                      ),
                    ),
                    IconButton(
                      key: const Key('navigate_to_address_button'),
                      onPressed: () {},
                      icon: const Icon(Icons.directions, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('delivery_address_card')), findsOneWidget);
      expect(find.text('Delivery Address'), findsOneWidget);
      expect(find.text('123 Main Street, Apt 4B'), findsOneWidget);
      expect(find.text('New York, NY 10001'), findsOneWidget);
      expect(find.byKey(const Key('navigate_to_address_button')), findsOneWidget);
    });

    testWidgets('should display action buttons', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Container(
                key: const Key('action_buttons_section'),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        key: const Key('report_issue_button'),
                        onPressed: () {},
                        icon: const Icon(Icons.report_problem),
                        label: const Text('Report an Issue'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        key: const Key('cancel_order_button'),
                        onPressed: () {},
                        icon: const Icon(Icons.cancel),
                        label: const Text('Cancel Order'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        key: const Key('contact_support_button'),
                        onPressed: () {},
                        icon: const Icon(Icons.support_agent),
                        label: const Text('Contact Support'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('action_buttons_section')), findsOneWidget);
      expect(find.byKey(const Key('report_issue_button')), findsOneWidget);
      expect(find.text('Report an Issue'), findsOneWidget);
      expect(find.byKey(const Key('cancel_order_button')), findsOneWidget);
      expect(find.text('Cancel Order'), findsOneWidget);
      expect(find.byKey(const Key('contact_support_button')), findsOneWidget);
      expect(find.text('Contact Support'), findsOneWidget);
    });

    testWidgets('should display order completion state', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Center(
                child: Container(
                  key: const Key('order_completed_card'),
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 60,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Order Delivered!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Your order has been delivered successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              key: const Key('rate_order_button'),
                              onPressed: () {},
                              child: const Text('Rate Order'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              key: const Key('reorder_button'),
                              onPressed: () {},
                              child: const Text('Reorder'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byKey(const Key('order_completed_card')), findsOneWidget);
      expect(find.text('Order Delivered!'), findsOneWidget);
      expect(find.text('Your order has been delivered successfully'), findsOneWidget);
      expect(find.byKey(const Key('rate_order_button')), findsOneWidget);
      expect(find.text('Rate Order'), findsOneWidget);
      expect(find.byKey(const Key('reorder_button')), findsOneWidget);
      expect(find.text('Reorder'), findsOneWidget);
    });

    testWidgets('should handle real-time status updates', (WidgetTester tester) async {
      // Arrange
      String currentStatus = 'Preparing Order';

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      Container(
                        key: const Key('status_update_card'),
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.update, color: Colors.blue),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Status: $currentStatus',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Updated now',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        key: const Key('simulate_update_button'),
                        onPressed: () {
                          setState(() {
                            currentStatus = 'Out for Delivery';
                          });
                        },
                        child: const Text('Simulate Status Update'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Act
      expect(find.text('Status: Preparing Order'), findsOneWidget);

      await tester.tap(find.byKey(const Key('simulate_update_button')));
      await tester.pump();

      // Assert
      expect(find.text('Status: Out for Delivery'), findsOneWidget);
      expect(find.byKey(const Key('status_update_card')), findsOneWidget);
      expect(find.text('Updated now'), findsOneWidget);
    });
  });
}