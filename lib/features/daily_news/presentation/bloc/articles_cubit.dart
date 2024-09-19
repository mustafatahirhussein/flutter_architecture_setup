import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_architecture/features/daily_news/data/models/article_model.dart';
import 'package:project_architecture/features/daily_news/domain/usecases/articles_usecase.dart';
import '../../domain/entities/articles.dart';

part 'article_state.dart';

class ArticlesCubit extends Cubit<ArticleState> {
  ArticlesCubit(this.articlesUsecase) : super(ArticleState());

  final GetArticlesUsecase articlesUsecase;

  void getArticles() async {
    emit(state.copyWith(articles: []));
    final articles = await articlesUsecase.call();

    List<dynamic> data = articles.data['articles'];
    List<ArticleModel>? list = data.map((e) => ArticleModel.fromJson(e)).toList();
    emit(state.copyWith(articles: list));
  }
}