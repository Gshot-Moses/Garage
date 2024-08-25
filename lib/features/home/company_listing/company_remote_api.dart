import 'package:chopper/chopper.dart';

part 'company_remote_api.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class CompanyRemoteApi extends ChopperService {

  static CompanyRemoteApi create({ChopperClient? client}) => _$CompanyRemoteApi(client);

  @Get(path: "/companies")
  Future<Response> getCompanies();
}