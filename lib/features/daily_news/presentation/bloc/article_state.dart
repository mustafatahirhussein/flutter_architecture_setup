part of 'articles_cubit.dart';

class ArticleState {
  List<ArticleEntity>? articles;

  ArticleState({this.articles});

  ArticleState copyWith({List<ArticleEntity>? articles}) {
    return ArticleState(
      articles: articles ?? this.articles,
    );
  }
}