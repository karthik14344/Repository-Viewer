// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push

//**in this file the code is written for both starred_repos_notifier and searched_repos_notifier**//

// this the place where we will be going to get all the repositories
//and this is also where we will be keep tracking on page which we will be getting next
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/core/infrastructure/pagination_config.dart';

import '../../../../core/domain/fresh.dart';
import '../../../core/domain/github_repo.dart';

part 'paginated_repos_notifier.freezed.dart';

typedef RepositoryGetter
    = Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> Function(int page);

@freezed
class PaginatedReposState with _$PaginatedReposState {
  const PaginatedReposState._();
  const factory PaginatedReposState.initial(
    Fresh<List<GithubRepo>> repos,
  ) = _Initial;
  const factory PaginatedReposState.loadInProgress(
    Fresh<List<GithubRepo>> repos,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory PaginatedReposState.loadInSuccess(
    Fresh<List<GithubRepo>> repos, {
    required bool isNextPageAvailable,
  }) = _LoadInSuccess;
  const factory PaginatedReposState.loadFailure(
    Fresh<List<GithubRepo>> repos,
    GithubFailure failure,
  ) = _LoadFailure;
}

class PaginatedReposNotifier extends StateNotifier<PaginatedReposState> {
  PaginatedReposNotifier() : super(PaginatedReposState.initial(Fresh.yes([])));

  int _page = 1;

  @protected
  Future<void> getNextPage(RepositoryGetter getter) async {
    // when ever this method is called i.e to load the next Paginated repos page
    state = PaginatedReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    ); //once the state is set to loading process and the UI is notified about that change.\
    //then we are going to get Paginatedrepospage from repositories
    final failureOrRepos = await getter(_page);
    state = failureOrRepos.fold(
      (l) => PaginatedReposState.loadFailure(state.repos, l),
      (r) {
        _page++; //incrementation of page
        return PaginatedReposState.loadInSuccess(
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
