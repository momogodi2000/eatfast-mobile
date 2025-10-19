import '../models/enums.dart';

extension OrderStatusExtensions on OrderStatus {
  bool get isActive => 
    this != OrderStatus.completed && 
    this != OrderStatus.cancelled && 
    this != OrderStatus.rejected && 
    this != OrderStatus.expired;
}