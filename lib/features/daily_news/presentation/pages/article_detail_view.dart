import 'package:flutter/material.dart';

class ArticleDetailView extends StatelessWidget {
  const ArticleDetailView({Key? key, this.article,}) : super(key: key);

  final String? article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(article ?? ""),
      ),
    );
  }
}
