import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:project_architecture/core/resources/api_response.dart';
import 'package:project_architecture/core/utils/app_snackbar.dart';
import 'package:project_architecture/core/utils/app_storage.dart';
import 'package:project_architecture/config/base_source/base_api_service.dart';

class BaseApiServiceImpl implements BaseApiService {
  var dio = Dio();

  /// get Request
  @override
  Future<ApiResponse<dynamic>> getRequestProvider(
      {required String path, Map<String, dynamic>? queryParameter}) async {
    late final Response response;
    const int timeout = 20000;

    try {
      String? token = await AppStorage().getToken();
      dio.options.connectTimeout = const Duration(milliseconds: timeout);
      response = await dio.get("https://newsapi.org/v2/top-headlines?apiKey=ff957763c54c44d8b00e5e082bc76cb0&country=us&category=general",
        queryParameters: queryParameter,
        // options: Options(
        //     headers: {
        //       "Authorization": "Bearer $token",
        //       "Accept": "application/json"
        //     },
        //     sendTimeout: const Duration(milliseconds: timeout),
        //     receiveTimeout: const Duration(milliseconds: timeout))
      );

      return ApiSuccess(response.data);

    } on DioException catch (e) {
      AppSnackbar.logMessage("*************************");
      AppSnackbar.logMessage("getRequestProvider error: ${e.error}");
      AppSnackbar.logMessage("getRequestProvider response error: ${e.response}");
      AppSnackbar.logMessage(
          "getRequestProvider status code: ${e.response?.statusCode}");
      AppSnackbar.logMessage("DioException: ${e.response?.statusMessage}");
      AppSnackbar.logMessage("*************************");
      if (e.response?.statusCode != null) {
        if (e.response?.statusCode != 500) {
          return ApiError(e.response);
        }
      }
    }
    return ApiError(response.data);
  }

  /// post Request
  @override
  Future<ApiResponse> postRequestProvider(
      {required String path, required data, int? timeoutMinutes}) async {
    late final Response response;
    int timeout = 20000;

    try {
      String? token = await AppStorage().getToken();
      dio.options.connectTimeout = Duration(milliseconds: timeout);

      response = await dio.post(
        path,
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json"
          },
          sendTimeout: timeoutMinutes != null
              ? Duration(minutes: timeoutMinutes)
              : Duration(milliseconds: timeout),
          receiveTimeout: timeoutMinutes != null
              ? Duration(minutes: timeoutMinutes)
              : Duration(milliseconds: timeout),
        ),
      );

      return ApiSuccess(response.data);

    } on DioException catch (e) {
      if (kDebugMode) {
        AppSnackbar.logMessage("*************************");
        AppSnackbar.logMessage("postRequestProvider error: ${e.error}");
        AppSnackbar.logMessage(
            "postRequestProvider error response: ${e.response}");
        AppSnackbar.logMessage(
            "postRequestProvider error statusCode: ${e.response?.statusCode}");
        AppSnackbar.logMessage("DioException: ${e.response?.statusMessage}");
        AppSnackbar.logMessage("*************************");
      }
      if (e.response?.statusCode != null) {
        if (e.response?.statusCode != 500) {
          return ApiError(e.response);
        }
      }
    }
    return ApiError(response.data);
  }

  /// put Request
  @override
  Future<ApiResponse> putRequestProvider(
      {required String path, required data}) async {
    late final Response response;
    const int timeout = 20000;

    try {
      String? token = await AppStorage().getToken();
      dio.options.connectTimeout = const Duration(milliseconds: timeout);

      response = await dio.put(path,
          data: data,
          options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "Accept": "application/json"
              },
              sendTimeout: const Duration(milliseconds: timeout),
              receiveTimeout: const Duration(milliseconds: timeout)));

      return ApiSuccess(response.data);

    } on DioException catch (e) {
      if (kDebugMode) {
        AppSnackbar.logMessage("**************************");
        AppSnackbar.logMessage("postRequestProvider error: ${e.error}");
        AppSnackbar.logMessage(
            "postRequestProvider error response: ${e.response}");
        AppSnackbar.logMessage(
            "postRequestProvider error statusCode: ${e.response?.statusCode}");
        AppSnackbar.logMessage("DioException: ${e.response?.statusMessage}");
        AppSnackbar.logMessage("*************************");
      }
      if (e.response?.statusCode != null) {
        if (e.response?.statusCode != 500) {
          return ApiError(e.response);
        }
      }
    }
    return ApiError(response.data);
  }

  /// patch request
  @override
  Future<ApiResponse> patchRequestProvider(
      {required String path, required data}) async {
    late final Response response;
    const int timeout = 20000;

    try {
      String? token = await AppStorage().getToken();
      dio.options.connectTimeout = const Duration(milliseconds: timeout);

      response = await dio.patch(path,
          data: data,
          options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "Accept": "application/json"
              },
              sendTimeout: const Duration(milliseconds: timeout),
              receiveTimeout: const Duration(milliseconds: timeout)));

      return ApiSuccess(response.data);

    } on DioException catch (e) {
      if (kDebugMode) {
        AppSnackbar.logMessage("**************************");
        AppSnackbar.logMessage("patchRequestProvider error: ${e.error}");
        AppSnackbar.logMessage(
            "patchRequestProvider error response: ${e.response}");
        AppSnackbar.logMessage(
            "patchRequestProvider error statusCode: ${e.response?.statusCode}");
        AppSnackbar.logMessage("DioException: ${e.response?.statusMessage}");
        AppSnackbar.logMessage("*************************");
      }
      if (e.response?.statusCode != null) {
        if (e.response?.statusCode != 500) {
          return ApiError(e.response);
        }
      }
    }
    return ApiError(response.data);
  }

  /// delete Request
  @override
  Future<ApiResponse> deleteRequestProvider(
      {required String path,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameter}) async {
    late final Response response;
    const int timeout = 20000;

    try {
      String? token = await AppStorage().getToken();
      dio.options.connectTimeout = const Duration(milliseconds: timeout);
      response = await dio.delete(path,
          data: data,
          queryParameters: queryParameter,
          options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "Accept": "application/json"
              },
              sendTimeout: const Duration(milliseconds: timeout),
              receiveTimeout: const Duration(milliseconds: timeout)));

      return ApiSuccess(response.data);

    } on DioException catch (e) {
      if (kDebugMode) {
        AppSnackbar.logMessage("*************************");
        AppSnackbar.logMessage("deleteRequestProvider error: ${e.error}");
        AppSnackbar.logMessage(
            "deleteRequestProvider error response: ${e.response}");
        AppSnackbar.logMessage(
            "deleteRequestProvider status code: ${e.response?.statusCode}");
        AppSnackbar.logMessage("DioException: ${e.response?.statusMessage}");
        AppSnackbar.logMessage("*************************");
      }
      if (e.response?.statusCode != null) {
        if (e.response?.statusCode != 500) {
          return ApiError(e.response);
        }
      }
    }
    return ApiError(response.data);
  }

}