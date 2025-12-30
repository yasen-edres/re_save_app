import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/update_item_request.dart';
import 'package:re_save_app/domain/entities/response/update_item_response.dart';
import 'package:re_save_app/domain/repositories/update_item_repository.dart';

@injectable
class UpdateItemUseCase{
  UpdateItemRepository updateItemRepository;

  UpdateItemUseCase({required this.updateItemRepository});

  Future<UpdateItemResponse> invoke(UpdateItemRequest updateItemRequest, int itemId){
    return updateItemRepository.updateItem(updateItemRequest,itemId);
  }
}