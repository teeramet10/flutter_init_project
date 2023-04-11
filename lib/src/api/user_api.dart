import 'package:dio/dio.dart';
import 'package:logbook/src/model/request/login_request.dart';
import 'package:logbook/src/model/response/login_response.dart';
import 'package:retrofit/retrofit.dart';

part "user_api.g.dart";

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {required String baseUrl}) = _UserApi;
  @POST('login')
  Future<LoginResponse> loginPassword(
    @Body() LoginRequest request,
  );
}
