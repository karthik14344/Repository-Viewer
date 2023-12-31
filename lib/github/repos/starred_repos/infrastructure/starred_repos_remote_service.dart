import 'package:dio/dio.dart'; //This imports the Dio package, which is an HTTP client for Dart. It allows making HTTP requests and handling responses.
import 'package:repo_viewer/core/infrastructure/remote_responses.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';

import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers_cache.dart';
import 'package:repo_viewer/github/repos/core/infrastructure/repos_remote_service.dart';

class StarredReposRemoteService extends ReposRemoteService {
  StarredReposRemoteService(
    Dio dio,
    GithubHeadersCache headersCache,
  ) : super(dio, headersCache);

  // indicating the page number of the starred repositories to retrieve
  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async =>
      super.getPage(
        requestUri: Uri.https(
          'api.github.com',
          '/user/starred',
          {
            'page': '$page',
            'per_page': PaginationConfig.itemsPerPage.toString(),
          },
        ),
        jsonDataSelector: ((json) => json as List<dynamic>),
      );
}
