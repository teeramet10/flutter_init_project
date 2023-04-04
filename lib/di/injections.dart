import 'package:dio/dio.dart';
import 'package:example_project/api/user_api.dart';
import 'package:example_project/app/app_cubit.dart';
import 'package:example_project/repository/user_repository.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get_it/get_it.dart';
import 'package:example_project/constant/env_constant.dart';
import 'package:example_project/utils/share_preference_util.dart';

GetIt getIt = GetIt.instance;

final Dio _dio =
    _baseOptionSetup('${FlavorConfig.instance.variables[EnvConstant.baseURL]}');

Dio _baseOptionSetup(String baseUrl) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    ),
  );
}

Future<void> setupInjection() async {
  await _registerAppComponents();
  _registerDatabase();
  _registerApi();
  _registerRepository();
  _registerCubit();
}

Future<void> _registerAppComponents() async {
  // * Helpers
  final SharedPreferencesUtil sharedPreferencesUtil =
      await SharedPreferencesUtil.getInstance();
  getIt.registerSingleton<SharedPreferencesUtil>(sharedPreferencesUtil);

  _dioSetup(dio: _dio);
}

void _dioSetup({required Dio dio}) {
  String loginPath = "";
  String refreshTokenPath = "";

  dio.interceptors.addAll(
    <Interceptor>[
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        if (!options.uri.path.contains(loginPath)) {
          String? _accessToken;
          if (_accessToken != null) {
            options.headers.addAll(
              <String, dynamic>{'Authorization': 'Bearer $_accessToken'},
            );
          }
        }
        handler.next(options);
      }, onError: ((DioError error, ErrorInterceptorHandler handler) async {
        final Response<dynamic>? response = error.response;
        if (response == null) {
          handler.reject(error);
          return;
        }
        String? _refreshToken;
        if (response.statusCode == 401 &&
            !response.realUri.path.endsWith(loginPath)) {
          try {
            if (response.realUri.path.contains(refreshTokenPath) ||
                _refreshToken == null) {
              throw error;
            }

            //call api refresh token

            //continue api
            Response<dynamic> continuesResponse =
                await dio.requestUri(response.realUri);
            handler.resolve(continuesResponse);
          } catch (_) {
            //logout
          }
        } else {
          handler.reject(error);
        }
      })),
    ],
  );
  dio.options.headers.addAll(
    <String, dynamic>{
      'content-type': 'application/json',
      'accept': 'application/json',
    },
  );
}

void _registerRepository() {
  getIt.registerLazySingleton(
    () => UserRepositoryImpl(api: getIt()),
  );
}

void _registerApi() {
  getIt.registerSingleton(UserApi(_dio, baseUrl: _dio.options.baseUrl));
}

void _registerCubit() {
  getIt.registerLazySingleton(
    () => AppCubit(),
  );
}

void _registerDatabase() {
  // getIt.registerFactory(() =>);
}
