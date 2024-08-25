import 'package:garage/features/signup/api/sign_up_api.dart';
import 'package:garage/features/signin/api/sign_in_api.dart';

import 'local_storage.dart';

class AuthRepo {
  final SignUpService signUpApi;
  final SignInService signInApi;
  final LocalStorage localStorage;

  AuthRepo({
    required this.signInApi,
    required this.signUpApi,
    required this.localStorage,
  });

  Future<void> signIn(String email, String password) async {
    var response = await signInApi.login({"email": email, "password": password});
    if (response.isSuccessful) {

    }
  }

  Future<void> signUp(String email, String name, String password) async {}
}