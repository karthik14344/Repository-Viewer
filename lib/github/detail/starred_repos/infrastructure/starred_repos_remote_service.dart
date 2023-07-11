import 'package:dio/dio.dart';
import 'package:repo_viewer/core/infrastructure/remote_responses.dart';

import '../../../core/infrastructure/github_repo_dto.dart';

class StarredReposRemoteService {
  final Dio _dio;

  StarredReposRemoteService(this._dio);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {}
}
