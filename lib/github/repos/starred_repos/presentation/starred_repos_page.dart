import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_router.gr.dart';
import 'package:repo_viewer/github/core/shared/providers.dart';

import '../../core/presentation/paginated_repo_list_view.dart';

@RoutePage()
class StarredReposPage extends ConsumerStatefulWidget {
  const StarredReposPage({super.key});

  @override
  _StarredReposPageState createState() => _StarredReposPageState();
}

class _StarredReposPageState extends ConsumerState<StarredReposPage> {
  get onPressed => null;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      //this is to add a couple micro seconds to read the
      //starredReposNotifierProvider
      () => ref
          .read(starredReposNotifierProvider.notifier)
          .getNextStarredReposPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred repos'),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.logoutVariant),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
          ),
          IconButton(
            icon: Icon(MdiIcons.magnify),
            onPressed: () {
              AutoRouter.of(context)
                  .push(SearchedReposRoute(searchTerm: 'github'));
            },
          )
        ],
      ),
      body: PaginatedRepoListView(
        paginatedReposNotifierProvider: starredReposNotifierProvider,
        getNextPage: (ref) {
          ref
              .read(starredReposNotifierProvider.notifier)
              .getNextStarredReposPage();
        },
        noResultsMessage:
            "That's about everything we could find out in your starred repos right now.",
      ),
    );
  }
}
