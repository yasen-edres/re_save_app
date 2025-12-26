abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  String errorMessage;

  ProfileError({required this.errorMessage});
}

class ProfileSuccess extends ProfileState {}
