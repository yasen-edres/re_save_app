import 'package:injectable/injectable.dart';
import 'package:re_save_app/data/data_sources/remote/public/get_items_remote_data_source.dart';
import 'package:re_save_app/domain/entities/response/public/get_items_response.dart';

import '../../../domain/repositories/public/get_items_repository.dart';

@Injectable(as: GetItemsRepository)
class GetItemsRepositoryImpl implements GetItemsRepository {
  GetItemsRemoteDataSource getItemsRemoteDataSource;

  GetItemsRepositoryImpl({required this.getItemsRemoteDataSource});

  @override
  Future<GetItemsResponse> getItems() {
    return getItemsRemoteDataSource.getItems();
  }
}
