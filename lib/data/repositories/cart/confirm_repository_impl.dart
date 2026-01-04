import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/cart/confirm_remote_dtata_source.dart';
import 'package:re_save_app/domain/entities/response/cart/confirm_response.dart';

import '../../../domain/entities/request/cart/confirm_request.dart';
import '../../../domain/repositories/cart/confirm_repository.dart';

@Injectable(as: ConfirmRepository)
class ConfirmRepositoryImpl implements ConfirmRepository{
  ConfirmRemoteDataSource confirmRemoteDataSource;

  ConfirmRepositoryImpl({required this.confirmRemoteDataSource});

  @override
  Future<ConfirmResponse> confirm(ConfirmRequest confirmRequest) {
    return confirmRemoteDataSource.confirm(confirmRequest);
  }

}