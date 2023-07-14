//list of repositories that we are willong to show in our completed app in SatrredRepospage

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/github_repo.dart';

class RepoTile extends StatelessWidget {
  final GithubRepo repo;
  const RepoTile({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repo.name),
      subtitle: Text(
        repo.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: CircleAvatar(
          backgroundImage: NetworkImage(repo.owner.avatarUrl),
          backgroundColor: Colors.transparent),
    );
  }
}
