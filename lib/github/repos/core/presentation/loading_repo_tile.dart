import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRepoTile extends StatelessWidget {
  const LoadingRepoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: ListTile(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 14,
            width: 100,
            color: Colors.grey,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 14,
            width: 250,
            color: Colors.grey,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        leading: const CircleAvatar(),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star_border),
            Text(
              '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
