import '../../../../core/resources/api_response.dart';

abstract class NewsApiService {
  Future<ApiResponse>? getArticles();
}