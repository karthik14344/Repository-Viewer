import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/core/domain/github_failure.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';
import 'package:repo_viewer/github/repos/core/presentation/paginated_repo_list_view.dart';

class FailureRepoTile extends ConsumerWidget {
  final GithubFailure failure;

  const FailureRepoTile({
    super.key,
    required this.failure,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTileTheme(
      textColor: Theme.of(context).colorScheme.onError,
      iconColor: Theme.of(context).colorScheme.onError,
      child: Card(
        color: Theme.of(context).colorScheme.error,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: const Text('An error occurred, please, retry'),
          subtitle: Text(
            failure.map(api: (_) => 'Api returned ${_.errorCode}'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.warning),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context
                  .findAncestorWidgetOfExactType<PaginatedRepoListView>()
                  ?.getNextPage(ref);
            },
          ),
        ),
      ),
    );
  }
}
