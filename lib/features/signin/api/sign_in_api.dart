import 'package:chopper/chopper.dart';

part 'sign_in_api.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class SignInService extends ChopperService {

  static SignInService create({ChopperClient? client}) => _$SignInService(client);

  @Post(path: "/signin")
  Future<Response> login(@Body() Map<String, dynamic> data);

  @Get(path: "/users/me")
  Future<Response> getUserInfo();
}