import 'models.dart';

class ProfileState {

  final bool isLoading;
  final UserInfo? userInfo;
  final bool hasError;

  ProfileState({this.isLoading = false, this.userInfo, this.hasError = false});

  ProfileState copy({bool? isLoading, UserInfo? userInfo, bool? hasError}) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      userInfo: userInfo ?? this.userInfo,
      hasError: hasError ?? this.hasError
    );
  }
}