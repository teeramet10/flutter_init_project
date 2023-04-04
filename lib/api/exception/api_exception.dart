import 'dart:io';

import 'package:dio/dio.dart';
import 'package:example_project/model/error_model.dart';

Exception handleDioError(DioError dioError) {
  try {
    if (dioError.response != null) {
      ErrorModel error = ErrorModel.fromJson(
        dioError.response?.data['error'],
      );

      return ApiException.from(
        error,
        dioError.response?.statusCode ?? 500,
      );
    } else {
      return dioError.error as ApiException;
    }
  } catch (e) {
    return ApiException(
      code: dioError.response?.statusCode,
      exception: dioError.error,
    );
  }
}

class ApiException implements Exception {
  ApiException({
    this.message = '',
    this.httpStatusCode,
    this.code,
    this.exception,
    this.errorDetail,
  });

  final String? message;
  final int? code;
  final int? httpStatusCode;
  dynamic exception;
  final String? errorDetail;

  ApiException.from(
    ErrorModel error,
    this.httpStatusCode,
  )   : code = error.code ?? 500,
        message = error.title ?? "",
        errorDetail = error.detail ?? "";

  String get mapErrorMessage {
    //No internet
    if (exception is SocketException) {
      return "No Internet";
    }

    if (exception is String) {
      if ((exception as String).contains(
        'Connecting timed out',
      )) {
        String message = 'Connecting timed out';
        String? error = exception as String?;

        return '$message\n$error';
      }
    }
    //Can not mapping response from API
    if (exception is TypeError) {
      return "Mapping error.";
    }

    if (code == null) {
      return "Something went wrong.";
    }

    return errorDetail ?? "";
  }
}
