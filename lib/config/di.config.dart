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
import '../api/data_sources/remote/profile/update_profile_remote_data_source_impl.dart'
    as _i289;
import '../api/data_sources/remote/profile/user_data_remote_data_source_impl.dart'
    as _i851;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/auth_remote_data_source.dart' as _i354;
import '../data/data_sources/remote/update_profile_remote_data_source.dart'
    as _i491;
import '../data/data_sources/remote/user_data_remote_data_source.dart' as _i893;
import '../data/repositories/auth_repository_impl.dart' as _i74;
import '../data/repositories/update_profile_repository_impl.dart' as _i491;
import '../data/repositories/user_data_repository_impl.dart' as _i392;
import '../domain/repositories/auth_repository.dart' as _i800;
import '../domain/repositories/update_profile_repository.dart' as _i56;
import '../domain/repositories/user_data_repository.dart' as _i181;
import '../domain/usecases/login_use_case.dart' as _i646;
import '../domain/usecases/register_use_case.dart' as _i744;
import '../domain/usecases/update_profile_use_case.dart' as _i68;
import '../domain/usecases/user_data_use_case.dart' as _i897;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/cubit/profile_view_model.dart' as _i83;

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
    gh.factory<_i354.AuthRemoteDataSource>(
      () =>
          _i983.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i491.UpdateProfileRemoteDataSource>(
      () => _i289.UpdateProfileRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i893.UserDataRemoteDataSource>(
      () => _i851.UserDataRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i800.AuthRepository>(
      () => _i74.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i354.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i56.UpdateProfileRepository>(
      () => _i491.UpdateProfileRepositoryImpl(
        updateProfileRemoteDataSource:
            gh<_i491.UpdateProfileRemoteDataSource>(),
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
    gh.factory<_i586.RegisterViewModel>(
      () => _i586.RegisterViewModel(gh<_i744.RegisterUseCase>()),
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
    gh.factory<_i83.ProfileViewModel>(
      () => _i83.ProfileViewModel(
        gh<_i897.UserDataUseCase>(),
        gh<_i68.UpdateProfileUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
