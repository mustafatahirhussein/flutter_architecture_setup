import '../../../../core/resources/api_response.dart';

abstract class ArticleRepository {

  Future<ApiResponse<dynamic>> getArticles();
}