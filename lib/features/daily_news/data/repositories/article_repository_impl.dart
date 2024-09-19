import 'package:project_architecture/core/resources/api_response.dart';
import 'package:project_architecture/features/daily_news/domain/repositories/article_repository.dart';
import '../../../../config/base_source/base_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {

  final BaseApiService _apiService;
  ArticleRepositoryImpl(this._apiService);

  @override
  Future<ApiResponse<dynamic>> getArticles() async {
    final response = _apiService.getRequestProvider(path: '/top-headlines');
    return response;
    }

}