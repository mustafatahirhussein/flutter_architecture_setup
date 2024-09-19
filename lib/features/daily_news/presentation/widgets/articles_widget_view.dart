import 'package:project_architecture/features/daily_news/domain/entities/articles.dart';

import '../../../../exports.dart';

class ArticlesWidgetView extends StatelessWidget {
  final ArticleEntity? item;

  const ArticlesWidgetView({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item?.title ?? ""),
      onTap: () {
        sl<NavigationService>().push('/detail',
            arguments: ArticleDetailView(article: item?.title ?? ""));
      },
    );
  }
}
