import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String>currentUserr();
  Future<String> userEmail();
}
class Auth implements BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> currentUserr() async {
    User user = await _firebaseAuth.currentUser;
    return user?.uid;
  }
  @override
  Future<String> userEmail() async {
    User user = await _firebaseAuth.currentUser;
    return user?.email;
  }



}