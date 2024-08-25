
class SignInState {

  final bool isLoading;
  final bool hasFailed;
  String? accessToken;

  SignInState({
    this.isLoading = false,
    this.hasFailed = false,
    this.accessToken = ""
  });

  SignInState copy({bool? isLoading, bool? hasFailed, String? accessToken}) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      hasFailed: hasFailed ?? this.hasFailed,
      accessToken: accessToken ?? this.accessToken
    );
  }
}