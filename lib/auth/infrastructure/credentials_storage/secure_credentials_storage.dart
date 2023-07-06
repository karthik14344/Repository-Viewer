import 'package:oauth2/src/credentials.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCredentialsStorage implements CredentialsStorage {
  final FlutterSecureStorage _storage;

  SecureCredentialsStorage(this._storage);

  static const _key = 'oauth2_credentials';
  Credentials? _cachedCredentials;
  // As long as the user is signed-in  credentials will be cached(storing in a temporary location)
  //so that we could readily get the credentials even much faster

  @override
  Future<Credentials?> read() async {
    if (_cachedCredentials != null) {
      return _cachedCredentials;
    } // if the cachedCredentials are null it means that
    //the user is already signed-in...

    final json = await _storage.read(key: _key);
    // json variable is used because 'read' returns a future string
    //which in this case is json
    if (json == null) {
      return null;
    } // if the user got signed out the json, so there will be no credentials will be null thus we are
    // returning the null indicating that there is no user singed-in
    // and there is no credentials to return.

    try {
      return _cachedCredentials = Credentials.fromJson(json);
    } on FormatException {
      return null;
    } // we are using the _cached_credentials again in here
    //because the if a user is already signed in and he is opening the app for
    //nth tym the read method will directly read the credentials from the
    //cached storage location.
  }

  @override
  Future<void> save(Credentials credentials) {
    _cachedCredentials = credentials;
    return _storage.write(key: _key, value: credentials.toJson());
  }

  @override
  Future<void> clear() {
    _cachedCredentials = null;
    return _storage.delete(key: _key);
  }
}
