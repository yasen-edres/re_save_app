import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/get_cart_response.dart';
import 'package:re_save_app/domain/repositories/get_cart_repository.dart';

@injectable
class GetCartUseCase {
  final GetCartRepository getCartRepository;

  GetCartUseCase({required this.getCartRepository});

  Future<GetCartResponse> getCart(){
    return getCartRepository.getCart();
  }

}