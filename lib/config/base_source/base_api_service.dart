import '../../core/resources/api_response.dart';

abstract class BaseApiService {

  Future<ApiResponse<dynamic>> getRequestProvider({required String path, Map<String, dynamic>? queryParameter});
  Future<ApiResponse<dynamic>> postRequestProvider({required String path, required data, int? timeoutMinutes});
  Future<ApiResponse<dynamic>> putRequestProvider({required String path, required data});
  Future<ApiResponse<dynamic>> patchRequestProvider({required String path, required data});
  Future<ApiResponse<dynamic>> deleteRequestProvider({required String path, Map<String, dynamic>? data, Map<String, dynamic>? queryParameter});
}