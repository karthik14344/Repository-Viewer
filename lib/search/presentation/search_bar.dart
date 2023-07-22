import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:repo_viewer/search/shared/providers.dart';

class Searchbar extends ConsumerStatefulWidget {
  final Widget body;
  final String title;
  final String hint;
  final void Function(String searchTerm) onShouldNavigateToResultPage;
  final void Function() onSignOutButtonPressed;

  const Searchbar({
    Key? key,
    required this.body,
    required this.title,
    required this.hint,
    required this.onShouldNavigateToResultPage,
    required this.onSignOutButtonPressed,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<Searchbar> {
  late FloatingSearchBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FloatingSearchBarController();
    Future.microtask(
      () => ref.read(searchHistoryNotifierProvider.notifier).watchSearchTerms(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _controller,
      body: FloatingSearchBarScrollNotifier(
        child: widget.body,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'Tap to search 👆',
            style: Theme.of(context).textTheme.bodySmall,
          ), //(windows key + ;) for emoji list
        ],
      ),
      hint: widget.hint,
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
        FloatingSearchBarAction(
          child: IconButton(
            icon: Icon(MdiIcons.logoutVariant),
            splashRadius: 18,
            onPressed: () {
              widget.onSignOutButtonPressed();
            },
          ),
        )
      ],
      onSubmitted: (query) {
        widget.onShouldNavigateToResultPage(query);
        ref.read(searchHistoryNotifierProvider.notifier).addSearchTerm(query);
        _controller.close();
      },
      builder: (context, transition) {
        return Consumer(
          builder: (context, ref, child) {
            final searchHistoryState = ref.watch(searchHistoryNotifierProvider);
            return searchHistoryState.map(
              data: (history) {
                return Column(
                  children: history.value
                      .map(
                        (term) => ListTile(
                          title: Text(term),
                        ),
                      )
                      .toList(),
                );
              },
              loading: (_) => const ListTile(
                title: LinearProgressIndicator(),
              ),
              error: (_) => ListTile(
                title: Text('very unexpected error ${_.error}'),
              ),
            );
          },
        );
      },
    );
  }
}
