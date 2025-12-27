import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/update_profile_request.dart';
import 'package:re_save_app/domain/entities/response/user_data_response.dart';
import 'package:re_save_app/domain/usecases/update_profile_use_case.dart';
import 'package:re_save_app/domain/usecases/user_data_use_case.dart';
import 'package:re_save_app/features/ui/cubit/profile_state.dart';

import '../../../core/exceptions/app_exception.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  UserDataUseCase userDataUseCase;
  UpdateProfileUseCase updateProfileUseCase;
  UserDataResponse? user;

  ProfileViewModel(this.userDataUseCase, this.updateProfileUseCase)
    : super(ProfileInitial());

  void getUserData() async {
    emit(ProfileLoading());
    try {
      final userDataResponse = await userDataUseCase.invoke();
      user = userDataResponse;
      emit(ProfileSuccess());
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(ProfileError(errorMessage: message));
    }
  }

  void updateProfile(String name, String phone, String image) async {
    emit(ProfileLoading());
    try {
      final request = UpdateProfileRequest(
        name: name,
        image: image,
        phone: phone,
      );
      await updateProfileUseCase.invoke(request);
      emit(ProfileSuccess());
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(ProfileError(errorMessage: message));
    }
  }
}
