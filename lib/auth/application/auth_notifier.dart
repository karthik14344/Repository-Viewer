import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';
import 'package:repo_viewer/domain/auth_failure.dart';
import 'package:state_notifier/state_notifier.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() =
      _Initial; //when the app starts first we need to check whether there is nay
  //any access token in the storage or not.until then we won't be knowing whether
  //we are signed in or not so that it will be an initial state..in this initial we will be displaying the
  //github logo with a loading symbol
  const factory AuthState.unauthenticated() =
      _Unauthenticated; //if user is signd-out
  const factory AuthState.authenticated() =
      _Authenticated; //if the user is signed in
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

class AuthNotifier extends StateNotifier<AuthState> {
  final GithubAuthenticator _authenticator;
  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSignedIn())
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  //to sign-in method
  //we are going to pass a higher order function in the sign-in method to return a Redirect a Uri
  Future<void> signIn(AuthUriCallback authorizationCallback) async {
    final grant = _authenticator.createGrant();
    final redirectUrl =
        await authorizationCallback(_authenticator.getAuthorizationUrl(grant));
    final failureOrSuccess = await _authenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.authenticated(),
    );
    grant.close();
  }

  //to signout method
  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signout();
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.authenticated(),
    );
  }
}
