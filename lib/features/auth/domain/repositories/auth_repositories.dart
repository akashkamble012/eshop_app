import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';

abstract class AuthRepositories {
  Future<Either<Failure, Success>> createUser({
    required String userName,
    required String emailId,
    required String passWord,
  });
  Future<Either<Failure, Success>> login({required String emailId, required String passWord});
  Future<void> logout();
  Stream<User?> userChange();
  Future<Either<Failure, Success>> getUserDetails();
}
