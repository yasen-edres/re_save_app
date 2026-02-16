// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_services.dart' as _i124;
import '../api/data_sources/remote/auth/auth_remote_data_source_impl.dart'
    as _i983;
import '../api/data_sources/remote/cart/add_item_to_cart_remote_data_source_impl.dart'
    as _i105;
import '../api/data_sources/remote/cart/confirm_remote_data_source_impl.dart'
    as _i395;
import '../api/data_sources/remote/cart/get_cart_remote_data_source_impl.dart'
    as _i865;
import '../api/data_sources/remote/cart/remove_item_remote_data_source_impl.dart'
    as _i94;
import '../api/data_sources/remote/cart/update_item_remote_data_source_impl.dart'
    as _i304;
import '../api/data_sources/remote/item/get_items_remote_data_source_impl.dart'
    as _i517;
import '../api/data_sources/remote/profile/change_password_remote_data_source_impl.dart'
    as _i346;
import '../api/data_sources/remote/profile/update_profile_remote_data_source_impl.dart'
    as _i289;
import '../api/data_sources/remote/profile/user_data_remote_data_source_impl.dart'
    as _i851;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/auth/auth_remote_data_source.dart' as _i16;
import '../data/data_sources/remote/cart/add_item_to_cart_remote_data_source.dart'
    as _i256;
import '../data/data_sources/remote/cart/confirm_remote_dtata_source.dart'
    as _i696;
import '../data/data_sources/remote/cart/get_cart_remote_data_source.dart'
    as _i746;
import '../data/data_sources/remote/cart/remove_item_remote_data_source.dart'
    as _i498;
import '../data/data_sources/remote/cart/update_item_remote_data_source.dart'
    as _i802;
import '../data/data_sources/remote/profile/change_password_remote_data_source.dart'
    as _i737;
import '../data/data_sources/remote/profile/update_profile_remote_data_source.dart'
    as _i312;
import '../data/data_sources/remote/profile/user_data_remote_data_source.dart'
    as _i1002;
import '../data/data_sources/remote/public/get_items_remote_data_source.dart'
    as _i538;
import '../data/repositories/auth/auth_repository_impl.dart' as _i27;
import '../data/repositories/cart/add_item_to_cart_repository_impl.dart'
    as _i790;
import '../data/repositories/cart/confirm_repository_impl.dart' as _i503;
import '../data/repositories/cart/get_cart_repository_impl.dart' as _i584;
import '../data/repositories/cart/remove_item_repository_impl.dart' as _i663;
import '../data/repositories/cart/update_item_repository_impl.dart' as _i756;
import '../data/repositories/profile/change_password_repository_impl.dart'
    as _i330;
import '../data/repositories/profile/update_profile_repository_impl.dart'
    as _i91;
import '../data/repositories/profile/user_data_repository_impl.dart' as _i809;
import '../data/repositories/public/get_items_repository_impl.dart' as _i927;
import '../domain/repositories/auth/auth_repository.dart' as _i1064;
import '../domain/repositories/cart/add_item_to_cart_repository.dart' as _i168;
import '../domain/repositories/cart/confirm_repository.dart' as _i162;
import '../domain/repositories/cart/get_cart_repository.dart' as _i259;
import '../domain/repositories/cart/remove_item_respository.dart' as _i710;
import '../domain/repositories/cart/update_item_repository.dart' as _i825;
import '../domain/repositories/profile/change_password_repository.dart'
    as _i865;
import '../domain/repositories/profile/update_profile_repository.dart' as _i932;
import '../domain/repositories/profile/user_data_repository.dart' as _i699;
import '../domain/repositories/public/get_items_repository.dart' as _i89;
import '../domain/usecases/auth/login_use_case.dart' as _i21;
import '../domain/usecases/auth/register_use_case.dart' as _i413;
import '../domain/usecases/cart/add_item_to_cart_use_case.dart' as _i483;
import '../domain/usecases/cart/confirm_use_cse.dart' as _i689;
import '../domain/usecases/cart/get_cart_use_case.dart' as _i773;
import '../domain/usecases/cart/remove_item_use_case.dart' as _i603;
import '../domain/usecases/cart/update_item_use_case.dart' as _i602;
import '../domain/usecases/profile/change_password_use_case.dart' as _i598;
import '../domain/usecases/profile/update_profile_use_case.dart' as _i63;
import '../domain/usecases/profile/user_data_use_case.dart' as _i455;
import '../domain/usecases/public/get_items_use_case.dart' as _i557;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/home/tabs/add_tab/cubit/order_view_model.dart' as _i134;
import '../features/ui/home/tabs/cart_tab/cubit/cart_view_model.dart' as _i548;
import '../features/ui/home/tabs/category_tab/cubit/category_view_model.dart'
    as _i87;
import '../features/ui/home/tabs/profile_tab/cubit/profile_view_model.dart'
    as _i248;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => getItModule.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i312.UpdateProfileRemoteDataSource>(
      () => _i289.UpdateProfileRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i498.RemoveItemRemoteDataSource>(
      () => _i94.RemoveItemRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i746.GetCartRemoteDataSource>(
      () => _i865.GetCartRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i710.RemoveItemRepository>(
      () => _i663.RemoveItemRepositoryImpl(
        removeItemRemoteDataSource: gh<_i498.RemoveItemRemoteDataSource>(),
      ),
    );
    gh.factory<_i603.RemoveItemUseCase>(
      () => _i603.RemoveItemUseCase(
        removeItemRepository: gh<_i710.RemoveItemRepository>(),
      ),
    );
    gh.factory<_i259.GetCartRepository>(
      () => _i584.GetCartRepositoryImpl(
        getCartRemoteDataSource: gh<_i746.GetCartRemoteDataSource>(),
      ),
    );
    gh.factory<_i932.UpdateProfileRepository>(
      () => _i91.UpdateProfileRepositoryImpl(
        updateProfileRemoteDataSource:
            gh<_i312.UpdateProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i773.GetCartUseCase>(
      () => _i773.GetCartUseCase(
        getCartRepository: gh<_i259.GetCartRepository>(),
      ),
    );
    gh.factory<_i737.ChangePasswordRemoteDataSource>(
      () => _i346.ChangePasswordRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i538.GetItemsRemoteDataSource>(
      () => _i517.GetItemsRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i89.GetItemsRepository>(
      () => _i927.GetItemsRepositoryImpl(
        getItemsRemoteDataSource: gh<_i538.GetItemsRemoteDataSource>(),
      ),
    );
    gh.factory<_i696.ConfirmRemoteDataSource>(
      () => _i395.ConfirmRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i1002.UserDataRemoteDataSource>(
      () => _i851.UserDataRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i802.UpdateItemRemoteDataSource>(
      () => _i304.UpdateItemRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i256.AddItemToCartRemoteDataSource>(
      () => _i105.AddItemToCartRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i162.ConfirmRepository>(
      () => _i503.ConfirmRepositoryImpl(
        confirmRemoteDataSource: gh<_i696.ConfirmRemoteDataSource>(),
      ),
    );
    gh.factory<_i699.UserDataRepository>(
      () => _i809.UserDataRepositoryImpl(
        userDataRemoteDataSource: gh<_i1002.UserDataRemoteDataSource>(),
      ),
    );
    gh.factory<_i16.AuthRemoteDataSource>(
      () =>
          _i983.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i689.ConfirmUseCase>(
      () => _i689.ConfirmUseCase(
        confirmRepository: gh<_i162.ConfirmRepository>(),
      ),
    );
    gh.factory<_i1064.AuthRepository>(
      () => _i27.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i16.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i21.LoginUseCase>(
      () => _i21.LoginUseCase(repository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i413.RegisterUseCase>(
      () => _i413.RegisterUseCase(repository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i63.UpdateProfileUseCase>(
      () => _i63.UpdateProfileUseCase(
        updateProfileRepository: gh<_i932.UpdateProfileRepository>(),
      ),
    );
    gh.factory<_i455.UserDataUseCase>(
      () => _i455.UserDataUseCase(
        userDataRepository: gh<_i699.UserDataRepository>(),
      ),
    );
    gh.factory<_i865.ChangePasswordRepository>(
      () => _i330.ChangePasswordRepositoryImpl(
        changePasswordRemoteDataSource:
            gh<_i737.ChangePasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i825.UpdateItemRepository>(
      () => _i756.UpdateItemRepositoryImpl(
        updateItemRemoteDataSource: gh<_i802.UpdateItemRemoteDataSource>(),
      ),
    );
    gh.factory<_i557.GetItemsUseCase>(
      () => _i557.GetItemsUseCase(
        getItemsRepository: gh<_i89.GetItemsRepository>(),
      ),
    );
    gh.factory<_i87.CategoryViewModel>(
      () =>
          _i87.CategoryViewModel(getItemsUseCase: gh<_i557.GetItemsUseCase>()),
    );
    gh.factory<_i598.ChangePasswordUseCase>(
      () => _i598.ChangePasswordUseCase(
        changePasswordRepository: gh<_i865.ChangePasswordRepository>(),
      ),
    );
    gh.factory<_i168.AddItemToCartRepository>(
      () => _i790.AddItemToCartRepositoryImpl(
        addItemToCartRemoteDataSource:
            gh<_i256.AddItemToCartRemoteDataSource>(),
      ),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(gh<_i21.LoginUseCase>()),
    );
    gh.factory<_i483.AddItemToCartUseCase>(
      () => _i483.AddItemToCartUseCase(
        addItemToCartRepository: gh<_i168.AddItemToCartRepository>(),
      ),
    );
    gh.factory<_i586.RegisterViewModel>(
      () => _i586.RegisterViewModel(gh<_i413.RegisterUseCase>()),
    );
    gh.factory<_i248.ProfileViewModel>(
      () => _i248.ProfileViewModel(
        gh<_i455.UserDataUseCase>(),
        gh<_i63.UpdateProfileUseCase>(),
        gh<_i598.ChangePasswordUseCase>(),
      ),
    );
    gh.factory<_i602.UpdateItemUseCase>(
      () => _i602.UpdateItemUseCase(
        updateItemRepository: gh<_i825.UpdateItemRepository>(),
      ),
    );
    gh.factory<_i134.OrderViewModel>(
      () => _i134.OrderViewModel(
        addItemToCartUseCase: gh<_i483.AddItemToCartUseCase>(),
      ),
    );
    gh.factory<_i548.CartViewModel>(
      () => _i548.CartViewModel(
        getCartUseCase: gh<_i773.GetCartUseCase>(),
        removeItemUseCase: gh<_i603.RemoveItemUseCase>(),
        updateItemUseCase: gh<_i602.UpdateItemUseCase>(),
        confirmUseCase: gh<_i689.ConfirmUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
