import 'package:dartz/dartz.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/detail/starred_repos/infrastructure/starred_repos_remote_service.dart';

class StarredReposRepository {
  final StarredReposRemoteService _remoteService;

  //TODO: local service
  StarredReposRepository(this._remoteService);

  Future<Either<GithubFailure, List<GithubRepo>>> getStarredReposPage(
    int page,
  ) async {}
}
