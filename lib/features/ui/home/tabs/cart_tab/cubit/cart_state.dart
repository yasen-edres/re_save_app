class CartState{}
class CartLoading extends CartState{}
class CartInitialize extends CartState{}
class CartError extends CartState{
  String errorMessage;
  CartError({required this.errorMessage});
}
class CartSuccess extends CartState{

}
