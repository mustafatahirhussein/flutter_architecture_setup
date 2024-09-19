import 'package:project_architecture/core/resources/api_response.dart';
import 'package:project_architecture/core/usecases/usecases.dart';
import 'package:project_architecture/features/daily_news/domain/repositories/article_repository.dart';

class GetArticlesUsecase extends usecases<ApiResponse<dynamic>, void> {

  final ArticleRepository articleRepository;
  GetArticlesUsecase(this.articleRepository);

  @override
  Future<ApiResponse<dynamic>> call({void params}) async {
    var articles = await articleRepository.getArticles();
    return articles;
  }
}