// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push

// this the place where we will be going to get all the repositories
//and this is also where we will be keep tracking on page which we will be getting next
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';

import '../../../../core/domain/fresh.dart';
import '../../../core/domain/github_repo.dart';

part 'starred_repos_notifier.freezed.dart';

@freezed
class StarredReposState with _$StarredReposState {
  const StarredReposState._();
  const factory StarredReposState.initial() = _Initial;
  const factory StarredReposState.loadInProgress() = _LoadInProgress;
  const factory StarredReposState.loadInSuccess(Fresh<List<GithubRepo>> repos,
      {required bool isNextPageAvailable}) = _LoadInSuccess;
  const factory StarredReposState.loadFailure(GithubFailure failure) =
      _LoadFailure;
}
