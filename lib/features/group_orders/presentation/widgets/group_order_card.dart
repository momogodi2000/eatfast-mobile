import 'package:flutter/material.dart';
import '../../domain/models/group_order.dart';

class GroupOrderCard extends StatelessWidget {
  final GroupOrder groupOrder;
  final VoidCallback? onTap;
  
  const GroupOrderCard({
    super.key,
    required this.groupOrder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(groupOrder.groupName ?? 'Group Order'),
        subtitle: Text(groupOrder.restaurantName),
        trailing: Text(groupOrder.status.displayName),
        onTap: onTap,
      ),
    );
  }
}