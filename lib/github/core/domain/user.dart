// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required String name,
    required String avatarUrl,
  }) = _User;
}
