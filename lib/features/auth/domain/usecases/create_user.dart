import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../repositories/auth_repositories.dart';

class CreateUser {
  final AuthRepositories __authRepositories;

  const CreateUser(this.__authRepositories);

  Future<Either<Failure, Success>> call({
    required String userName,
    required String emailId,
    required String passWord,
  }) async {
    return await __authRepositories.createUser(
      userName: userName,
      emailId: emailId,
      passWord: passWord,
    );
  }
}
