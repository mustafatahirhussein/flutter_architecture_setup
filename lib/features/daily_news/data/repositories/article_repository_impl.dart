import 'package:project_architecture/core/resources/api_response.dart';
import 'package:project_architecture/features/daily_news/data/data_source/article_data_source.dart';
import 'package:project_architecture/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {

  final ArticleDataSource _apiService;
  ArticleRepositoryImpl(this._apiService);

  @override
  Future<ApiResponse<dynamic>> getArticles() async {
    final response = _apiService.getArticles();
    return response;
    }

}