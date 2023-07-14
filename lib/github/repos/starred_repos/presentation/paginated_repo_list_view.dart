import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/starred_repos/application/starred_repos_notifier.dart';
import 'package:repo_viewer/github/repos/starred_repos/presentation/repo_tile.dart';

class PaginatedRepoListView extends StatelessWidget {
  const PaginatedRepoListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(starredReposNotifierProvider);
      return ListView.builder(
        itemCount: state.map(
          initial: (_) => 0,
          loadInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
          loadInSuccess: (_) => _.repos.entity.length,
          loadFailure: (_) => _.repos.entity.length + 1,
        ),
        itemBuilder: (context, index) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => Container(),
            loadInSuccess: (_) => RepoTile(
              repo: _.repos.entity[index],
            ),
            loadFailure: (_) => Container(),
          );
        },
      );
    });
  }
}