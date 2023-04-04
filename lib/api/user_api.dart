import 'package:dio/dio.dart';
import 'package:example_project/model/request/login_request.dart';
import 'package:example_project/model/response/login_response.dart';
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
