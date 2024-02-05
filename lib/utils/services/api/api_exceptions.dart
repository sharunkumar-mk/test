// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class RestAPIException implements Exception {
  RestAPIException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.sendTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.unknown:
        message = dioError.message;
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.badCertificate:
        message = "Invalid certificate";
        break;

      case DioErrorType.badResponse:
        message = _handleError(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String? _handleError(int? statusCode, data) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Url not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
