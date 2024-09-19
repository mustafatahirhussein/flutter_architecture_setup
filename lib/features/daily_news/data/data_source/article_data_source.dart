import 'package:project_architecture/config/base_source/base_api_service_impl.dart';

import '../../../../core/resources/api_response.dart';

class ArticleDataSource extends BaseApiServiceImpl {

  final BaseApiServiceImpl _apiService;
  ArticleDataSource(this._apiService);

  Future<ApiResponse<dynamic>> getArticles() async {
    final response = _apiService.getRequestProvider(path: '/top-headlines');
    return response;
  }

}