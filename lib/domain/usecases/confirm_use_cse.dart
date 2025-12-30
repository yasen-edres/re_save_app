import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/confirm_request.dart';
import 'package:re_save_app/domain/entities/response/confirm_response.dart';
import 'package:re_save_app/domain/repositories/confirm_repository.dart';

@injectable
class ConfirmUseCase{
  ConfirmRepository confirmRepository;

  ConfirmUseCase({required this.confirmRepository});

  Future<ConfirmResponse> invoke(ConfirmRequest confirmRequest){
    return confirmRepository.confirm(confirmRequest);
  }

}