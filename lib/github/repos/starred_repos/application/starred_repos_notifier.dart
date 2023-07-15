// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push

// this the place where we will be going to get all the repositories
//and this is also where we will be keep tracking on page which we will be getting next
//the entire code is in Paginated_repos_notifier.dart
import 'package:repo_viewer/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:repo_viewer/github/repos/starred_repos/infrastructure/starred_repos_repository.dart';

class StarredReposNotifier extends PaginatedReposNotifier {
  final StarredReposRepository _repository;

  StarredReposNotifier(this._repository);

  Future<void> getNextStarredReposPage() async {
    super.getNextPage((page) => _repository.getStarredReposPage(page));
  }
}
