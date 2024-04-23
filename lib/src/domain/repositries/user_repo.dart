import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:speechth/src/domain/models/sign_up_model.dart';
import 'package:speechth/src/domain/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserRepo {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signUp(SignUpModel signUpModel) async {
    String? status = '';
    try{
    await _auth
        .createUserWithEmailAndPassword(
            email: signUpModel.email.text, password: signUpModel.password.text)
        .then((value) {
      signUpModel.userId = value.user?.uid;

      DatabaseReference userData = _database.ref("Users/${signUpModel.userId}");

      userData.set(signUpModel.toJson());
      print(signUpModel.toJson());
      status = "success";
    });
    } on FirebaseAuthException catch  (e) {

      status = e.message;
    }
    on Error {
      status = null;
    }
    return status;
  }

  Future<bool> signIn({required String email, required String password}) async {
    bool status = false;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      status = true;
    }).catchError((e) {
      status = false;
    });
    return status;
  }

  Future<bool> logout() async {
    bool status = false;
    await _auth.signOut().then((value) {
      status = true;
    }).catchError((e) {
      status = false;
    });
    return status;
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      var userId = _auth.currentUser?.uid;
      print(userId);
      DatabaseReference userData = _database.ref("Users/$userId");
      var result = await userData.get();
      print(result.value);
      var body = jsonEncode(result.value);
      var json = jsonDecode(body);
      return json;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> setCurrentTest(UserModel userModel) async {
    bool status = false;
    var userId = _auth.currentUser?.uid;
    DatabaseReference userData = _database.ref("Users/$userId");
    try {
      await userData.update(userModel.toJson());
      print("User Level ---->");
      print(userModel.toJson());
      status = true;
    } catch (e) {
      print(e.toString());
      status = false;
    }

    return status;
  }
  Future<bool> sendFeedBack(String message) async {
    bool status = false;
    String id = const Uuid().v1();
    DatabaseReference feedBackData = _database.ref("FeedBacks/$id");
    try {
      await feedBackData.set({
        "userId":_auth.currentUser?.uid,
        "message":message
      });
      status = true;
    } catch (e) {
      print(e.toString());
      status = false;
    }
    return status;
  }
}
