import 'package:get_it/get_it.dart';
import 'package:project_architecture/config/base_source/base_api_service_impl.dart';
import 'package:project_architecture/config/helpers/network_status.dart';
import 'package:project_architecture/config/routes/navigation_service.dart';
import 'package:project_architecture/features/daily_news/data/data_source/article_data_source.dart';
import 'package:project_architecture/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:project_architecture/features/daily_news/domain/repositories/article_repository.dart';
import 'package:project_architecture/features/daily_news/domain/usecases/articles_usecase.dart';
import 'package:dio/dio.dart';

import 'config/base_source/base_api_service.dart';
import 'features/daily_news/presentation/bloc/articles_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {

  sl.registerSingleton<NavigationService>(NavigationService());
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<BaseApiServiceImpl>(BaseApiServiceImpl());
  sl.registerSingleton<ArticleDataSource>(ArticleDataSource(sl()));

  sl.registerSingleton<NetworkStatusProvider>(NetworkStatusProvider());

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  
  sl.registerSingleton<GetArticlesUsecase>(GetArticlesUsecase(sl()));

  sl.registerFactory(() => ArticlesCubit(sl()));
}