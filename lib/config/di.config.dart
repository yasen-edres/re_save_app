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
import '../data/data_sources/remote/auth/auth_remote_data_source.dart' as _i354;
import '../data/data_sources/remote/cart/add_item_to_cart_remote_data_source.dart'
    as _i226;
import '../data/data_sources/remote/cart/confirm_remote_dtata_source.dart' as _i283;
import '../data/data_sources/remote/cart/get_cart_remote_data_source.dart' as _i78;
import '../data/data_sources/remote/cart/remove_item_remote_data_source.dart'
    as _i164;
import '../data/data_sources/remote/cart/update_item_remote_data_source.dart'
    as _i1030;
import '../data/data_sources/remote/profile/change_password_remote_data_source.dart'
    as _i574;
import '../data/data_sources/remote/profile/update_profile_remote_data_source.dart'
    as _i491;
import '../data/data_sources/remote/profile/user_data_remote_data_source.dart' as _i893;
import '../data/data_sources/remote/public/get_items_remote_data_source.dart' as _i919;
import '../data/repositories/auth/auth_repository_impl.dart' as _i74;
import '../data/repositories/cart/add_item_to_cart_repository_impl.dart' as _i854;
import '../data/repositories/cart/confirm_repository_impl.dart' as _i861;
import '../data/repositories/cart/get_cart_repository_impl.dart' as _i334;
import '../data/repositories/cart/remove_item_repository_impl.dart' as _i824;
import '../data/repositories/cart/update_item_repository_impl.dart' as _i842;
import '../data/repositories/profile/change_password_repository_impl.dart' as _i194;
import '../data/repositories/profile/update_profile_repository_impl.dart' as _i491;
import '../data/repositories/profile/user_data_repository_impl.dart' as _i392;
import '../data/repositories/public/get_items_repository_impl.dart' as _i1052;
import '../domain/repositories/auth/auth_repository.dart' as _i800;
import '../domain/repositories/cart/add_item_to_cart_repository.dart' as _i777;
import '../domain/repositories/cart/confirm_repository.dart' as _i717;
import '../domain/repositories/cart/get_cart_repository.dart' as _i443;
import '../domain/repositories/cart/remove_item_respository.dart' as _i242;
import '../domain/repositories/cart/update_item_repository.dart' as _i825;
import '../domain/repositories/profile/change_password_repository.dart' as _i682;
import '../domain/repositories/profile/update_profile_repository.dart' as _i56;
import '../domain/repositories/profile/user_data_repository.dart' as _i181;
import '../domain/repositories/public/get_items_repository.dart' as _i380;
import '../domain/usecases/auth/login_use_case.dart' as _i646;
import '../domain/usecases/auth/register_use_case.dart' as _i744;
import '../domain/usecases/cart/add_item_to_cart_use_case.dart' as _i361;
import '../domain/usecases/cart/confirm_use_cse.dart' as _i735;
import '../domain/usecases/cart/get_cart_use_case.dart' as _i121;
import '../domain/usecases/cart/remove_item_use_case.dart' as _i636;
import '../domain/usecases/cart/update_item_use_case.dart' as _i319;
import '../domain/usecases/profile/change_password_use_case.dart' as _i482;
import '../domain/usecases/profile/update_profile_use_case.dart' as _i68;
import '../domain/usecases/profile/user_data_use_case.dart' as _i897;
import '../domain/usecases/public/get_items_use_case.dart' as _i336;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/cubit/profile_view_model.dart' as _i83;
import '../features/ui/home/tabs/add_tab/cubit/order_view_model.dart' as _i134;
import '../features/ui/home/tabs/cart_tab/cubit/cart_view_model.dart' as _i548;
import '../features/ui/home/tabs/category_tab/cubit/category_view_model.dart'
    as _i87;

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
    gh.factory<_i226.AddItemToCartRemoteDataSource>(
      () => _i105.AddItemToCartRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i78.GetCartRemoteDataSource>(
      () => _i865.GetCartRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i283.ConfirmRemoteDataSource>(
      () => _i395.ConfirmRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i717.ConfirmRepository>(
      () => _i861.ConfirmRepositoryImpl(
        confirmRemoteDataSource: gh<_i283.ConfirmRemoteDataSource>(),
      ),
    );
    gh.factory<_i574.ChangePasswordRemoteDataSource>(
      () => _i346.ChangePasswordRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i1030.UpdateItemRemoteDataSource>(
      () => _i304.UpdateItemRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i354.AuthRemoteDataSource>(
      () =>
          _i983.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i919.GetItemsRemoteDataSource>(
      () => _i517.GetItemsRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i491.UpdateProfileRemoteDataSource>(
      () => _i289.UpdateProfileRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i777.AddItemToCartRepository>(
      () => _i854.AddItemToCartRepositoryImpl(
        addItemToCartRemoteDataSource:
            gh<_i226.AddItemToCartRemoteDataSource>(),
      ),
    );
    gh.factory<_i893.UserDataRemoteDataSource>(
      () => _i851.UserDataRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i164.RemoveItemRemoteDataSource>(
      () => _i94.RemoveItemRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i443.GetCartRepository>(
      () => _i334.GetCartRepositoryImpl(
        getCartRemoteDataSource: gh<_i78.GetCartRemoteDataSource>(),
      ),
    );
    gh.factory<_i735.ConfirmUseCase>(
      () => _i735.ConfirmUseCase(
        confirmRepository: gh<_i717.ConfirmRepository>(),
      ),
    );
    gh.factory<_i242.RemoveItemRepository>(
      () => _i824.RemoveItemRepositoryImpl(
        removeItemRemoteDataSource: gh<_i164.RemoveItemRemoteDataSource>(),
      ),
    );
    gh.factory<_i380.GetItemsRepository>(
      () => _i1052.GetItemsRepositoryImpl(
        getItemsRemoteDataSource: gh<_i919.GetItemsRemoteDataSource>(),
      ),
    );
    gh.factory<_i800.AuthRepository>(
      () => _i74.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i354.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i682.ChangePasswordRepository>(
      () => _i194.ChangePasswordRepositoryImpl(
        changePasswordRemoteDataSource:
            gh<_i574.ChangePasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i825.UpdateItemRepository>(
      () => _i842.UpdateItemRepositoryImpl(
        updateItemRemoteDataSource: gh<_i1030.UpdateItemRemoteDataSource>(),
      ),
    );
    gh.factory<_i482.ChangePasswordUseCase>(
      () => _i482.ChangePasswordUseCase(
        changePasswordRepository: gh<_i682.ChangePasswordRepository>(),
      ),
    );
    gh.factory<_i56.UpdateProfileRepository>(
      () => _i491.UpdateProfileRepositoryImpl(
        updateProfileRemoteDataSource:
            gh<_i491.UpdateProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i636.RemoveItemUseCase>(
      () => _i636.RemoveItemUseCase(
        removeItemRepository: gh<_i242.RemoveItemRepository>(),
      ),
    );
    gh.factory<_i336.GetItemsUseCase>(
      () => _i336.GetItemsUseCase(
        getItemsRepository: gh<_i380.GetItemsRepository>(),
      ),
    );
    gh.factory<_i646.LoginUseCase>(
      () => _i646.LoginUseCase(repository: gh<_i800.AuthRepository>()),
    );
    gh.factory<_i744.RegisterUseCase>(
      () => _i744.RegisterUseCase(repository: gh<_i800.AuthRepository>()),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(gh<_i646.LoginUseCase>()),
    );
    gh.factory<_i181.UserDataRepository>(
      () => _i392.UserDataRepositoryImpl(
        userDataRemoteDataSource: gh<_i893.UserDataRemoteDataSource>(),
      ),
    );
    gh.factory<_i361.AddItemToCartUseCase>(
      () => _i361.AddItemToCartUseCase(
        addItemToCartRepository: gh<_i777.AddItemToCartRepository>(),
      ),
    );
    gh.factory<_i586.RegisterViewModel>(
      () => _i586.RegisterViewModel(gh<_i744.RegisterUseCase>()),
    );
    gh.factory<_i121.GetCartUseCase>(
      () => _i121.GetCartUseCase(
        getCartRepository: gh<_i443.GetCartRepository>(),
      ),
    );
    gh.factory<_i319.UpdateItemUseCase>(
      () => _i319.UpdateItemUseCase(
        updateItemRepository: gh<_i825.UpdateItemRepository>(),
      ),
    );
    gh.factory<_i897.UserDataUseCase>(
      () => _i897.UserDataUseCase(
        userDataRepository: gh<_i181.UserDataRepository>(),
      ),
    );
    gh.factory<_i68.UpdateProfileUseCase>(
      () => _i68.UpdateProfileUseCase(
        updateProfileRepository: gh<_i56.UpdateProfileRepository>(),
      ),
    );
    gh.factory<_i548.CartViewModel>(
      () => _i548.CartViewModel(
        getCartUseCase: gh<_i121.GetCartUseCase>(),
        removeItemUseCase: gh<_i636.RemoveItemUseCase>(),
        updateItemUseCase: gh<_i319.UpdateItemUseCase>(),
        confirmUseCase: gh<_i735.ConfirmUseCase>(),
      ),
    );
    gh.factory<_i87.CategoryViewModel>(
      () =>
          _i87.CategoryViewModel(getItemsUseCase: gh<_i336.GetItemsUseCase>()),
    );
    gh.factory<_i134.OrderViewModel>(
      () => _i134.OrderViewModel(
        addItemToCartUseCase: gh<_i361.AddItemToCartUseCase>(),
      ),
    );
    gh.factory<_i83.ProfileViewModel>(
      () => _i83.ProfileViewModel(
        gh<_i897.UserDataUseCase>(),
        gh<_i68.UpdateProfileUseCase>(),
        gh<_i482.ChangePasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
