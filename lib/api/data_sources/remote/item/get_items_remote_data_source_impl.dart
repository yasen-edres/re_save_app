import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/public/get_items_response_mappers.dart';
import 'package:re_save_app/domain/entities/response/public/get_items_response.dart';

import '../../../../data/data_sources/remote/public/get_items_remote_data_source.dart';

@Injectable(as: GetItemsRemoteDataSource)
class GetItemsRemoteDataSourceImpl implements GetItemsRemoteDataSource {
  ApiServices apiServices;

  GetItemsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<GetItemsResponse> getItems() async {
    final response = await apiServices.getItems();
    return response.toGetItemsResponse();
  }
}
