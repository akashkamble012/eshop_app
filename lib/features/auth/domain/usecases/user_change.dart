import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/auth_repositories.dart';

class UserChanges {
  final AuthRepositories __authRepositories;

  const UserChanges(this.__authRepositories);

  Stream<User?> call()  {
    return  __authRepositories.userChange();
  }
}
