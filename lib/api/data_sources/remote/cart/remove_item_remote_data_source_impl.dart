import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/remove_item_mappers.dart';
import 'package:re_save_app/domain/entities/response/remove_item_response.dart';

import '../../../../data/data_sources/remote/remove_item_remote_data_source.dart';

@Injectable(as: RemoveItemRemoteDataSource)
class RemoveItemRemoteDataSourceImpl implements RemoveItemRemoteDataSource{
  ApiServices apiServices;

  RemoveItemRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<RemoveItemResponse> removeItem(int itemId) async{
    final response = await apiServices.removeItem(itemId);
    return response.toRemoveItemResponse();
  }

}