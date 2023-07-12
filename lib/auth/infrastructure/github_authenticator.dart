// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:repo_viewer/core/infrastructure/dio_extension.dart';
import 'package:repo_viewer/domain/auth_failure.dart';
import '../../core/shared/encoders.dart';

class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}

class GithubAuthenticator {
  final CredentialsStorage _credentialsStorage;
  final Dio _dio;

  GithubAuthenticator(
    this._credentialsStorage,
    this._dio,
  );

  static const clientId =
      'faeeffb9dc0c015bef65'; // we will be getting this info from the github in the devloper settings/oauth apps

  static const clientSecret =
      '1cbcdd3684ddc31c9f568d7b1cb7c3def1ff80d1'; // we will be getting this info from the github in the devloper settings/oauth apps

  static const scopes = [
    'read:user',
    'repo'
  ]; // we will be getting this info from the github in the devloper settings/oauth apps

  static final authorizationEndpoint = Uri.parse(
      'https://github.com/login/oauth/authorize'); // we will be getting this info from oauth2 package documentation

  static final tokenEndpoint = Uri.parse(
      'https://github.com/login/oauth/access_token'); // we will be getting this info from oauth2 package documentation

  static final revocationEndpoint =
      Uri.parse('https://api.github.com/applications/$clientId/grant');

  static final redirecturl = Uri.parse(
      'http://localhost:3000/callback'); // we will be getting this info from oauth2 package documentation

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage
          .read(); //gettiing the stored credentiasls from credentials_storage
      if (storedCredentials != null) {
        //if the user is singned in
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          final failureOrCredentials = await refresh(storedCredentials);
          return failureOrCredentials.fold((l) => null, (r) => r);
        }
      }

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  } // The async keyword marks the getSignedInCredentials() method as asynchronous and allows it to use await expressions, which pause execution until a future completes and then resumes with the result. This allows the method to perform I/O operations without blocking the main thread.

  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: GithubOAuthHttpClient(),
    );
  }

  //this method is created to get the authorization url(authorization code grant is from oauth2 package)
  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirecturl, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParams,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(queryParams);
      await _credentialsStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  //the below method is delete the access token because whenever the user gets signed in
  //multiple access tokens will be created and they wont be deleted eventhough the user is signedout..
  //the variables in below code are passed as per the delete token documentation.
  Future<Either<AuthFailure, Unit>> signout() async {
    final accessToken = await _credentialsStorage
        .read()
        .then((credentials) => credentials?.accessToken);

    final usernameAndPassword =
        stringToBase64.encode('$clientId:$clientSecret');

    try {
      try {
        await _dio.deleteUri(
          revocationEndpoint,
          data: {
            'access_token': accessToken,
          },
          options: Options(
            headers: {
              'Authorization': 'basic $usernameAndPassword',
            },
          ),
        );
      } on DioError catch (e) {
        //changed dioerror to dio exception
        if (e.isNoConnectionError) {
          //ignoring
        } else {
          rethrow;
        }
      }
      await _credentialsStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
    Credentials credentials,
  ) async {
    try {
      final refreshCredentials = await credentials.refresh(
        identifier: clientId,
        secret: clientSecret,
        httpClient: GithubOAuthHttpClient(),
      );
      await _credentialsStorage.save(refreshCredentials);
      return right(refreshCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
