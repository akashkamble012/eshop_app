import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../repositories/auth_repositories.dart';

class Login {
  final AuthRepositories __authRepositories;

  const Login(this.__authRepositories);

  Future<Either<Failure, Success>> call({
    required String emailId,
    required String passWord,
  }) async {
    return await __authRepositories.login(
      emailId: emailId,
      passWord: passWord,
    );
  }
}
