import 'package:chopper/chopper.dart';

part 'sign_up_api.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class SignUpService extends ChopperService {

  static SignUpService create({ChopperClient? client}) => _$SignUpService(client);

  @Post(path: "/signup")
  Future<Response> signUp(@Body() Map<String, dynamic> data);
}