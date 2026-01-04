import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/cart/confirm_request.dart';
import 'package:re_save_app/domain/entities/response/cart/confirm_response.dart';
import 'package:re_save_app/domain/repositories/cart/confirm_repository.dart';

@injectable
class ConfirmUseCase{
  ConfirmRepository confirmRepository;

  ConfirmUseCase({required this.confirmRepository});

  Future<ConfirmResponse> invoke(ConfirmRequest confirmRequest){
    return confirmRepository.confirm(confirmRequest);
  }

}