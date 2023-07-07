// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/github/core/infrastructure/user_dto.dart';

part 'github_repo_dto.freezed.dart';
part 'github_repo_dto.g.dart';

String _descriptionFromJson(Object? json) {
  return (json as String?) ?? '';
}

@freezed
class GithubRepoDTO with _$GithubRepoDTO {
  const GithubRepoDTO._();
  const factory GithubRepoDTO({
    required UserDTO owner,
    required String name,
    @JsonKey(fromJson: _descriptionFromJson) required String description,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
  }) = _GithubRepoDTO; //API error

  factory GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDTOFromJson(json);
}
