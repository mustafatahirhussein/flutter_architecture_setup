import 'package:project_architecture/config/themes/app_colors.dart';
import 'package:project_architecture/exports.dart';
import 'package:project_architecture/features/daily_news/presentation/widgets/articles_widget_view.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Articles'),
      ),
      body: BlocBuilder<ArticlesCubit, ArticleState>(
        bloc: sl()..getArticles(),
        builder: (context, state) {

          final item = state.articles;

          return item?.isEmpty ?? false ? const Center(child: CircularProgressIndicator()) : ListView.builder(
            shrinkWrap: true,
            itemCount: item?.length ?? 0,
            itemBuilder: (context, i) {
              final article = item?[i];
              return ArticlesWidgetView(item: article);
            },
          );
        }
      ),
    );
  }
}
