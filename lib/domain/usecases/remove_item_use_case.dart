import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/remove_item_response.dart';
import 'package:re_save_app/domain/repositories/remove_item_respository.dart';

@injectable
class RemoveItemUseCase{
  RemoveItemRepository removeItemRepository;

  RemoveItemUseCase({required this.removeItemRepository});

  Future<RemoveItemResponse> invoke(int itemId){
    return removeItemRepository.removeItem(itemId);
  }

}