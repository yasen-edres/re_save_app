import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/cart/update_item_request.dart';
import 'package:re_save_app/domain/entities/response/cart/update_item_response.dart';
import 'package:re_save_app/domain/repositories/cart/update_item_repository.dart';

@injectable
class UpdateItemUseCase{
  UpdateItemRepository updateItemRepository;

  UpdateItemUseCase({required this.updateItemRepository});

  Future<UpdateItemResponse> invoke(UpdateItemRequest updateItemRequest, int itemId){
    return updateItemRepository.updateItem(updateItemRequest,itemId);
  }
}