import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';

import '../../../../auth/shared/providers.dart';
import '../../core/presentation/paginated_repo_list_view.dart';

@RoutePage()
class SearchedReposPage extends ConsumerStatefulWidget {
  final String searchTerm;
  const SearchedReposPage({
    super.key,
    required this.searchTerm,
  });

  @override
  _SearchedReposPageState createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends ConsumerState<SearchedReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      //this is to add a couple micro seconds to read the
      //starredReposNotifierProvider
      () => ref
          .read(searchedReposNotifierProvider.notifier)
          .getNextSearchedReposPage(widget.searchTerm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchTerm),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.logoutVariant),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
          )
        ],
      ),
      body: PaginatedRepoListView(
        paginatedReposNotifierProvider: searchedReposNotifierProvider,
        getNextPage: (ref) {
          ref
              .read(searchedReposNotifierProvider.notifier)
              .getNextSearchedReposPage(widget.searchTerm);
        },
        noResultsMessage:
            "This is all we could find for your search term. Really...",
      ),
    );
  }
}
