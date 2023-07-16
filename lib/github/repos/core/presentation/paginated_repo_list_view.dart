import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/presentation/toasts.dart';
import 'package:repo_viewer/github/core/presentation/no_results_display.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:repo_viewer/github/repos/core/presentation/failure_repo_tile.dart';
import 'package:repo_viewer/github/repos/core/presentation/loading_repo_tile.dart';
import 'package:repo_viewer/github/repos/core/presentation/repo_tile.dart';

class PaginatedRepoListView extends StatefulWidget {
  final StateNotifierProvider<PaginatedReposNotifier, PaginatedReposState>
      paginatedReposNotifierProvider;
  final void Function(WidgetRef ref) getNextPage;
  final String noResultsMessage;

  const PaginatedRepoListView({
    super.key,
    required this.paginatedReposNotifierProvider,
    required this.getNextPage,
    required this.noResultsMessage,
  });

  @override
  State<PaginatedRepoListView> createState() => _PaginatedRepoListViewState();
}

class _PaginatedRepoListViewState extends State<PaginatedRepoListView> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen<PaginatedReposState>(
          widget.paginatedReposNotifierProvider,
          (previous, state) {
            state.map(
              initial: (_) => canLoadNextPage = true,
              loadInProgress: (_) => canLoadNextPage = false,
              loadInSuccess: (_) {
                if (!_.repos.isFresh && !hasAlreadyShownNoConnectionToast) {
                  hasAlreadyShownNoConnectionToast = true;
                  showNoConnectionToast(
                    "You're not online.Some information may be outdated.",
                    context,
                  );
                }
                canLoadNextPage = _.isNextPageAvailable;
              },
              loadFailure: (_) => canLoadNextPage = false,
            );
          },
        );
        final state = ref.watch(widget.paginatedReposNotifierProvider);
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final metrics = notification.metrics;
            final limit =
                metrics.maxScrollExtent - metrics.viewportDimension / 3;

            if (canLoadNextPage && metrics.pixels >= limit) {
              canLoadNextPage = false;
              widget.getNextPage(ref);
            }
            return false;
          },
          child: state.maybeWhen(
            loadInSuccess: (repos, _) => repos.entity.isEmpty,
            orElse: () => false,
          )
              ? NoResultsDisplay(
                  message: widget.noResultsMessage,
                )
              : _PaginatedListView(state: state),
        );
      },
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({
    super.key,
    required this.state,
  });

  final PaginatedReposState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
        loadInSuccess: (_) => _.repos.entity.length,
        loadFailure: (_) => _.repos.entity.length + 1,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => RepoTile(repo: _.repos.entity[index]),
          loadInProgress: (_) {
            if (index < _.repos.entity.length) {
              return RepoTile(repo: _.repos.entity[index]);
            } else {
              return const LoadingRepoTile();
            }
          },
          loadInSuccess: (_) => RepoTile(
            repo: _.repos.entity[index],
          ),
          loadFailure: (_) {
            if (index < _.repos.entity.length) {
              return RepoTile(repo: _.repos.entity[index]);
            } else {
              return FailureRepoTile(
                failure: _.failure,
              );
            }
          },
        );
      },
    );
  }
}
