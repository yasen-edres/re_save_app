import 'package:re_save_app/api/mappers/confirmItems_mappers.dart';

import '../../domain/entities/response/confirm_items.dart';
import '../model/confirm_items_dto.dart';

extension ConfirmItemsListMappers on List<ConfirmItemsDto> {
  List<ConfirmItems> toConfirmItems() {
    return map((item) => item.toConfirmItems()).toList();
  }
}