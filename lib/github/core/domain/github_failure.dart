// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push

//whenever in the app if we undergo under any error these failures will be called
import 'package:freezed_annotation/freezed_annotation.dart';
part 'github_failure.freezed.dart';

@freezed
class GithubFailure with _$GithubFailure {
  const GithubFailure._();
  const factory GithubFailure.api(int? errorCode) = _Api; //API error
}
