// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push

// this the place where we will be going to get all the repositories
//and this is also where we will be keep tracking on page which we will be getting next
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';

import '../../../../core/domain/fresh.dart';
import '../../../core/domain/github_repo.dart';
import '../infrastructure/starred_repos_repository.dart';

part 'starred_repos_notifier.freezed.dart';

@freezed
class StarredReposState with _$StarredReposState {
  const StarredReposState._();
  const factory StarredReposState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;
  const factory StarredReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory StarredReposState.loadInSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadInSuccess;
  const factory StarredReposState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _LoadFailure;
}

class StarredReposNotifier extends StateNotifier<StarredReposState> {
  final StarredReposRepository _repository;

  StarredReposNotifier(this._repository)
      : super(StarredReposState.initial(Fresh.yes([])));

  int _page = 1;

  Future<void> getNextStarredReposPage() async {
    // when ever this method is called i.e to load the next starred repos page
    state = StarredReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    ); //once the state is set to loading process and the UI is notified about that change.\
    //then we are going to get starredrepospage from repositories
    final failureOrRepos = await _repository.getStarredReposPage(_page);
    state = failureOrRepos.fold(
      (l) => StarredReposState.loadFailure(state.repos, l),
      (r) {
        _page++; //incrementation of page
        return StarredReposState.loadInSuccess(
          r.copyWith(entity: [
            ...state.repos.entity,
            ...r.entity,
          ]),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }
}
