import 'package:dartz/dartz.dart';
import 'package:repo_viewer/core/infrastructure/network_exceptions.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/core/domain/github_repo.dart';
import 'package:repo_viewer/github/core/infrastructure/github_repo_dto.dart';
import 'package:repo_viewer/github/detail/starred_repos/infrastructure/starred_repos_remote_service.dart';

import '../../../../core/domain/fresh.dart';

class StarredReposRepository {
  final StarredReposRemoteService _remoteService;

  StarredReposRepository(this._remoteService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
    int page,
  ) async {
    try {
      final remotePageItems = await _remoteService.getStarredReposPage(page);
      return right(
        remotePageItems.when(
          //TODO: local service
          noConnection: (maxPage) => Fresh.no(
            [],
            isNextPageAvailable: page < maxPage,
          ),
          //TODO: local service
          notModified: (maxPage) => Fresh.yes(
            [],
            isNextPageAvailable: page < maxPage,
          ),
          //TODO: save data in local service
          withNewData: (data, maxPage) {
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: page < maxPage,
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}

extension DTOListToDomainList on List<GithubRepoDTO> {
  List<GithubRepo> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
