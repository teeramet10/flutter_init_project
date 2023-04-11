import 'package:dio/dio.dart';
import 'package:logbook/src/api/exception/api_exception.dart';
import 'package:logbook/src/api/user_api.dart';
import 'package:logbook/src/model/request/login_request.dart';
import 'package:logbook/src/model/response/login_response.dart';

abstract class UserRepository {
  Future<LoginResponse> login(LoginRequest request);
}

class UserRepositoryImpl extends UserRepository {
  final UserApi api;

  UserRepositoryImpl({
    required this.api,
  });

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      return await api.loginPassword(request);
    } on DioError catch (error) {
      throw handleDioError(error);
    } catch (e) {
      throw ApiException(exception: e);
    }
  }
}
