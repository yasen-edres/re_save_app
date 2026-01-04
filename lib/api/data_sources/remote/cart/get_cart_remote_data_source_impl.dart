import 'package:injectable/injectable.dart';
import 'package:re_save_app/api/api_services.dart';
import 'package:re_save_app/api/mappers/cart/get_cart_mappers.dart';
import 'package:re_save_app/domain/entities/response/cart/get_cart_response.dart';

import '../../../../data/data_sources/remote/cart/get_cart_remote_data_source.dart';

@Injectable(as: GetCartRemoteDataSource)
class GetCartRemoteDataSourceImpl implements GetCartRemoteDataSource{
  final ApiServices apiServices;

  GetCartRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<GetCartResponse> geCart() async{
    final response = await apiServices.getCart();
    return response.toGetCartResponse();
  }

}