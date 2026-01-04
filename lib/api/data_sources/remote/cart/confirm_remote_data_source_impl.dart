import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/cart/confirm_request_mapper.dart';
import 'package:re_save_app/api/mappers/cart/confirm_response_mappers.dart';
import 'package:re_save_app/domain/entities/response/cart/confirm_response.dart';

import '../../../../data/data_sources/remote/cart/confirm_remote_dtata_source.dart';
import '../../../../domain/entities/request/cart/confirm_request.dart';

@Injectable(as: ConfirmRemoteDataSource)
class ConfirmRemoteDataSourceImpl implements ConfirmRemoteDataSource{
  ApiServices apiServices;

  ConfirmRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ConfirmResponse> confirm(ConfirmRequest confirmRequest) async{
    final response = await apiServices.confirm(confirmRequest.toConfirmRequestDto());
    return response.toConfirmResponse();
  }

}