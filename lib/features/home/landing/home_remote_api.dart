import 'package:chopper/chopper.dart';

part 'home_remote_api.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class ApiService extends ChopperService {

  static ApiService create({ChopperClient? client}) => _$ApiService(client);

  @Get(path: "/companies")
  Future<Response> getCompanies();
}