import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var __firebaseAuth = FirebaseAuth.instance;
  var __firebaseFirestore = FirebaseFirestore.instance;

  String? __userName;
  String? __email;
  String? __userId;
  String? __mobileNumber;
  Future<Map> creatUser({
    required String userName,
    required String emailId,
    required String passWord,
  }) async {
    Map data = {};
    try {
      UserCredential userInfo =
          await __firebaseAuth.createUserWithEmailAndPassword(
        email: emailId,
        password: passWord,
      );

      __userName = userName;
      __firebaseAuth.currentUser!.uid;
      data = {
        'message': 'Account create success',
        'userCredential': userInfo,
      };
      await __firebaseFirestore
          .collection('/UserData')
          .doc(userInfo.user!.uid)
          .set({
          'userName': userName,
          'email': emailId,
          'profileLink': '',
          'mobileNumber': '',
        },
      );
    } on FirebaseAuthException catch (error) {
      __userName = null;
      if (error.message!.contains('already')) {
        return {
          'message': 'Email address is already',
        };
      }
      return {
        'message': 'Something went wrong',
      };
    }
    update();
    return data;
  }

  Future<Map> loginUser(String emailId, String passWord) async {
    print('====$emailId   === $passWord');
    try {
      // UserCredential userInfo =
      UserCredential __user = await __firebaseAuth.signInWithEmailAndPassword(
        email: emailId.trim(),
        password: passWord.trim(),
      );
      var getUserData = await __firebaseFirestore
          .collection('/UserData')
          .doc('${__firebaseAuth.currentUser!.uid}')
          .get();
      __userId = __user.user!.uid;
      __email = getUserData['email'];
      __mobileNumber = getUserData['mobileNumber'];
      __userName = getUserData['userName'];
      print(__user);
      return {
        'message': 'Login Successful',
        'data': '',
        'plugin': '',
        'stacktrace': __user,
        'cre': __user.credential,
      };
    } on FirebaseAuthException catch (error) {
      print('login user error ===>${error.stackTrace}');
      return {
        'message': error.message,
        'data': error.code,
        'plugin': error.plugin,
        'stacktrace': error.stackTrace,
        'cre': error.credential,
      };
    }
  }

  Future<void> logout() async {
    await __firebaseAuth.signOut();
    __userName = null;
    update();
  }

  Future<void> getUserData() async {
    var getUserData = await __firebaseFirestore
        .collection('/UserData')
        .doc('${__firebaseAuth.currentUser!.uid}')
        .get();
    __userId = __firebaseAuth.currentUser!.uid;
    __email = getUserData['email'];
    __mobileNumber = getUserData['mobileNumber'];
    __userName = getUserData['userName'];
    update();
  }

  Map get currentUser {
    return {
      'user': __firebaseAuth.currentUser,
      'userId': __userId,
      'userName': __userName,
      'email': __email,
      'photoLink': '',
      'mobileNumber': __mobileNumber,
    };
  }
}
