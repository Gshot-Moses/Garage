import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:garage/features/home/appointments/appointment_remote_api.dart';
import 'package:garage/features/home/company_listing/company_remote_api.dart';
import 'package:garage/features/signup/api/sign_up_api.dart';

import 'package:garage/features/signin/api/sign_in_api.dart';


class ApiClient {
  static const String BASE_URL = "https://garage-floral-field-9662.fly.dev/api";
  late ChopperClient _client;

  ChopperClient get chopperClient => _client;

  ApiClient() {
    createChopperClient();
  }

  T getChopperService<T extends ChopperService>() {
    return _client.getService<T>();
  }

  void createChopperClient() {
    _client = ChopperClient(
        baseUrl: Uri.parse(BASE_URL),
        services: [
          SignInService.create(),
          SignUpService.create(),
          AppointmentRemoteApi.create(),
          CompanyRemoteApi.create(),
        ],
        interceptors: [
          HttpLoggingInterceptor()
          // AuthorizationInterceptor(token: token),
        ],
        // converter: const JsonToTypeConverter(jsonConvertorMap: {
        //   CompanyApiResponse: CompanyApiResponse.fromJson,
        // }),
        // errorConverter: const JsonToTypeConverter(
        //     jsonConvertorMap: {GeneralErrorModel: GeneralErrorModel.fromJson})
    );
  }
}

class AuthorizationInterceptor implements Interceptor {
  final String token;

  AuthorizationInterceptor({required this.token});

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    var request = applyHeader(chain.request, "Authorization", "Bearer $token");
    return chain.proceed(request);
  }
}