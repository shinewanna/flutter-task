import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/handlers/connectivity_handler.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:get/instance_manager.dart';

class AuthProvider extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signUp(
    String? email,
    String? password,
  ) async {
    if (await ConnectivityHandler.noInternet(isShowSnack: false)) {
      return AppConstant.def.noInternet;
    }

    try {
      final UserCredential user = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      _setUserId(user);
      return null;
    } on FirebaseAuthException catch (e) {
      return _chooseErrorMessage(e);
    }
  }

  Future<String?> signIn(
    String email,
    String password,
  ) async {
    if (await ConnectivityHandler.noInternet(isShowSnack: false)) {
      return AppConstant.def.noInternet;
    }
    try {
      final UserCredential user = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _setUserId(user);
      return null;
    } on FirebaseAuthException catch (e) {
      return _chooseErrorMessage(e);
    }
  }

  Future<String?> forgotPwd(String email) async {
    if (await ConnectivityHandler.noInternet(isShowSnack: false)) {
      return AppConstant.def.noInternet;
    }
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return _chooseErrorMessage(e);
    }
  }

  Future<void> _setUserId(UserCredential userCredential) async {
    if (userCredential.user == null) return;
    await CacheProvider.myId.setValue(userCredential.user!.uid);
  }

  _chooseErrorMessage(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email';
    } else if (e.code == 'wrong-password') {
      return 'User name or password wrong';
    } else if (e.message != null) {
      return e.message.toString();
    } else {
      return 'Something went wrong';
    }
  }

  Future<void> signOut() async {
    await CacheProvider.clear();
    Get.find<TaskProvider>(tag: AppConstant.def.all).dispose();
    Get.find<TaskProvider>(tag: AppConstant.def.completed).dispose();
    return _firebaseAuth.signOut();
  }
}
