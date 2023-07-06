import 'package:oauth2/oauth2.dart';

//This is an bastract class the implementation will be
//done in the secure_credential_storage.dart.

abstract class CredentialsStorage {
  Future<Credentials?> read(); //to read

  Future<void> save(Credentials credentials); //to save

  Future<void> clear(); //to clear after signing out
}
