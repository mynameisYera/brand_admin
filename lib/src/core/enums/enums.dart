enum TextFieldFocusState { focused, unfocused }

enum TextFieldValidationState { success, error, none }

enum OrderStateEnum {
  searching('searching'),
  accepted('accepted'),
  progress('progress'),
  waiting('waiting'),
  completed('completed'),
  canceled('canceled'),
  error('error');

  const OrderStateEnum(this.name);
  final String name;

  static OrderStateEnum fromString(String status) {
    switch (status) {
      case 'accepted':
        return OrderStateEnum.accepted;
      case 'awaiting':
        return OrderStateEnum.waiting;
      case 'on_route':
        return OrderStateEnum.progress;
      case 'completed':
        return OrderStateEnum.completed;
      case 'canceled':
        return OrderStateEnum.canceled;
      default:
        return OrderStateEnum.searching;
    }
  }
}

extension OrderStateEnumExt on OrderStateEnum {
  String get statusName {
    switch (this) {
      case OrderStateEnum.accepted:
        return 'Order accepted';
      case OrderStateEnum.waiting:
        return 'Waiting for client';
      case OrderStateEnum.progress:
        return 'Route started';
      case OrderStateEnum.completed:
        return 'Order completed';
      case OrderStateEnum.canceled:
        return 'Order canceled';
      default:
        return 'Order searching';
    }
  }
}
