import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/github/core/infrastructure/github_headers_cache.dart';

import '../../../core/shared/providers.dart';
import '../../repos/starred_repos/application/starred_repos_notifier.dart';
import '../../repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import '../../repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import '../../repos/starred_repos/infrastructure/starred_repos_repository.dart';

final githubHeadersCacheProvider = Provider(
  (ref) => GithubHeadersCache(ref.watch(sembastProvider)),
);

final satrredReposLocalServiceProvider = Provider(
  (ref) => StarredReposLocalService(ref.watch(sembastProvider)),
);
final satrredReposRemoteServiceProvider = Provider(
  (ref) => StarredReposRemoteService(
      ref.watch(dioProvider), ref.watch(githubHeadersCacheProvider)),
);

final starredReposRespositoryProvider = Provider(
  (ref) => StarredReposRepository(
    ref.watch(satrredReposRemoteServiceProvider),
    ref.watch(satrredReposLocalServiceProvider),
  ),
);

final starredReposNotifierProvider =
    StateNotifierProvider<StarredReposNotifier, StarredReposState>(
  (ref) => StarredReposNotifier(ref.watch(starredReposRespositoryProvider)),
);
