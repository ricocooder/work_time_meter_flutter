import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<User>currentUserr();
  Future<String> userEmail();
}
class Auth implements BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> currentUserr() async {
    User user = await _firebaseAuth.currentUser;
    return user;
  }
  @override
  Future<String> userEmail() async {
    User user = await _firebaseAuth.currentUser;
    return user?.email;
  }
}
