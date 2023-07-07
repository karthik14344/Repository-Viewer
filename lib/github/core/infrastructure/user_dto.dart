//git add .
// git commit -m ""
// git push

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_dto.freezed.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();
  const factory UserDTO({
    required String name,
    required String avatarUrl,
  }) = _UserDTO; //API error
}
