import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../datasources/auth_data_source.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  final AuthDatasource _authDatasource;

  AuthRepositoriesImpl(this._authDatasource);
  @override
  Future<Either<Failure, Success>> createUser(
      {required String userName, required String emailId, required String passWord}) {
    return _authDatasource.createUser(userName: userName, emailId: emailId, passWord: passWord);
  }

  @override
  Future<Either<Failure, Success>> getUserDetails() {
    return _authDatasource.getUserDetails();
  }

  @override
  Future<Either<Failure, Success>> login({required String emailId, required String passWord}) {
    return _authDatasource.login(emailId: emailId, passWord: passWord);
  }

  @override
  Future<void> logout() async {
    return _authDatasource.logout();
  }

  @override
  Stream<User?> userChange() {
    return _authDatasource.userChange();
  }
}
