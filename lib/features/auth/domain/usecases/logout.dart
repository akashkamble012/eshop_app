import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/auth_repositories.dart';

class Logout {
  final AuthRepositories __authRepositories;

  const Logout(this.__authRepositories);

  Future<void> call()  {
    return  __authRepositories.logout();
  }
}
