import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/get_items_response.dart';
import 'package:re_save_app/domain/repositories/get_items_repository.dart';

@injectable
class GetItemsUseCase {
  GetItemsRepository getItemsRepository;

  GetItemsUseCase({required this.getItemsRepository});

  Future<GetItemsResponse> invoke() {
    return getItemsRepository.getItems();
  }
}
