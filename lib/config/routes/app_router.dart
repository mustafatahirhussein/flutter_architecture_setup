import 'package:flutter/material.dart';
import 'package:project_architecture/features/daily_news/presentation/pages/article_detail_view.dart';
import '../../features/daily_news/presentation/pages/articles_view.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const ArticlesView());
      case '/detail':
        final arg = settings.arguments as ArticleDetailView;
        return MaterialPageRoute(builder: (context) => ArticleDetailView(
          article: arg.article,
        ));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}