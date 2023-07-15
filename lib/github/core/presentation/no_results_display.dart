import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NoResultsDisplay extends StatelessWidget {
  final String message;

  const NoResultsDisplay({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            MdiIcons.emoticonPoop,
            size: 96,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
