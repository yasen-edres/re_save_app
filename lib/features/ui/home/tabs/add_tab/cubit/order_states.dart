class OrderState {}

class OrderInitialize extends OrderState {}

class OrderError extends OrderState {
  String errorMessage;

  OrderError({required this.errorMessage});
}

class OrderSuccess extends OrderState {
  String? messageSuccess;
  OrderSuccess({this.messageSuccess});
}
class OrderLoading extends OrderState {}
