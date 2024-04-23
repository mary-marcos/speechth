import 'package:firebase_auth/firebase_auth.dart';

class Vars {
  static User? get user => FirebaseAuth.instance.currentUser;
}
