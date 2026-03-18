enum OrderStatus {
  created('Created'),
  accepted('Accepted'),
  waiting('Waiting'),
  startRoute('Start route'),
  complete('Complete'),
  cancel('Cancel');

  const OrderStatus(this.name);
  final String name;

  OrderStatus fromString(String status) {
    switch (status) {
      case 'accepted':
        return OrderStatus.accepted;
      case 'awaiting':
        return OrderStatus.waiting;
      case 'on_route':
        return OrderStatus.startRoute;
      case 'completed':
        return OrderStatus.complete;
      case 'canceled':
        return OrderStatus.cancel;
      default:
       return OrderStatus.created;
    }
  }
}

extension OrderStatusExt on OrderStatus {
  String get statusName {
    switch (this) {
      case OrderStatus.accepted:
        return 'Order accepted';
      case OrderStatus.waiting:
        return 'Waiting for client';
      case OrderStatus.startRoute:
        return 'Route started';
      case OrderStatus.complete:
        return 'Order completed';
      case OrderStatus.cancel:
        return 'Order canceled';
      default:
        return 'Order created';
    }
  }
}
