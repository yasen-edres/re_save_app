import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/confirm_request_mapper.dart';
import 'package:re_save_app/api/mappers/confirm_response_mappers.dart';
import 'package:re_save_app/domain/entities/response/confirm_response.dart';

import '../../../../data/data_sources/remote/confirm_remote_dtata_source.dart';
import '../../../../domain/entities/request/confirm_request.dart';

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