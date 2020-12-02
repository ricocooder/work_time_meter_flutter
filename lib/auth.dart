import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String>currentUser();
}
class Auth implements BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> currentUser() async {
    User user = await _firebaseAuth.currentUser;
    return user?.uid;
  }

}