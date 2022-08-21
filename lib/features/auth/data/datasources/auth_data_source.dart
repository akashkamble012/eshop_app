import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../common/common_message.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/success.dart';

abstract class AuthDatasource {
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

class AuthDatasourceImpl extends AuthDatasource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore __firebaseFirestore;

  AuthDatasourceImpl(this._firebaseAuth, this.__firebaseFirestore);

  @override
  Future<Either<Failure, Success>> createUser(
      {required String userName, required String emailId, required String passWord}) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(email: emailId, password: passWord);
      await __firebaseFirestore.collection('/UserData').doc(result.user!.uid).set(
        {
          'userName': userName,
          'email': emailId,
          'profileLink': '',
          'mobileNumber': '',
        },
      );

      return const Right(SuccessMessage(CommonMessage.loginSuccessMessage));
    } on FirebaseAuthException catch (error) {
      print('******* $error');
      if (error.message!.contains('already')) {
        return const Left(FailureMessage(CommonMessage.emailAlreadyExist));
      }
      return const Left(FailureMessage(CommonMessage.somethingwentWrong));
    }
  }

  @override
  Future<Either<Failure, Success>> getUserDetails() {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> login({required String emailId, required String passWord}) async {
    print('====$emailId   === $passWord');
    try {
      // UserCredential userInfo =
      UserCredential __user = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailId.trim(),
        password: passWord.trim(),
      );
      final getUserData = await __firebaseFirestore.collection('/UserData').doc(_firebaseAuth.currentUser!.uid).get();
      print('$getUserData***** $__user');
      return const Right(SuccessMessage(CommonMessage.loginSuccessMessage));
    } on FirebaseAuthException catch (error) {
      print('login user error ===>${error.message}');
      if (error.message != null && error.message!.contains('password')) {
        return Left(FailureMessage(error.message ?? ''));
      }
      if (error.message != null && error.message!.contains('delete')) {
        return const Left(FailureMessage('Invalid Email Id'));
      }
      return const Left(FailureMessage(CommonMessage.loginFaildMessage));
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<User?> userChange() {
    return _firebaseAuth.userChanges();
  }
}
