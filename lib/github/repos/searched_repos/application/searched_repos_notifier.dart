// this the place where we will be going to get all the repositories
//and this is also where we will be keep tracking on page which we will be getting next
//the entire code is in Paginated_repos_notifier.dart
import 'package:repo_viewer/github/repos/core/application/paginated_repos_notifier.dart';

import 'package:repo_viewer/github/repos/searched_repos/infrastructure/searched_repos_repository.dart';

class SearchedReposNotifier extends PaginatedReposNotifier {
  final SearchedReposRepository _repository;

  SearchedReposNotifier(this._repository);

  Future<void> getNextSearchedReposPage(String query) async {
    super.getNextPage((page) => _repository.getSearchedReposPage(query, page));
  }
}
