import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo.freezed.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const GithubRepo._();
  const factory GithubRepo() = _GithubRepo;
}
