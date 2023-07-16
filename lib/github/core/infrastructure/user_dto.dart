//git add .
// git commit -m ""
// git push

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:repo_viewer/github/core/domain/user.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();
  const factory UserDTO({
    @JsonKey(name: 'login') required String name,
    //this is to change the name in produced 'user_dto.g.dart' file as per the
    //GET request produced in github.rest
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    //this is to change the name in produced 'user_dto.g.dart' file as per the
    //GET request produced in github.rest
  }) = _UserDTO; //API error

  //this is to convert the json responses into code variables
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User _) {
    return UserDTO(
      name: _.name,
      avatarUrl: _.avatarUrl,
    );
  }

  User toDomain() {
    return User(
      name: name,
      avatarUrl: avatarUrl,
    );
  }
}
