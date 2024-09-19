import 'package:dio/dio.dart';

abstract class ApiResponse<T> {
  T? data;
  Response<dynamic>? responseType;

  ApiResponse({this.data, this.responseType});
}

class ApiSuccess<T> extends ApiResponse<T> {
  ApiSuccess(T? data) : super(data: data);
}

class ApiError<T> extends ApiResponse<T> {
  ApiError(Response<dynamic>? responseType) : super(responseType: responseType);
}