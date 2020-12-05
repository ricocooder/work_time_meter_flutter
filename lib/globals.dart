
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

final firestore = FirebaseFirestore.instance;

final timeFormatyyyy_MM_dd_HH_mm = new DateFormat('yyyy-MM-dd HH:mm');
final timeFormatyyyy_MM_dd_HH_mm_ss = new DateFormat('yyyy-MM-dd HH:mm:ss');
final timeFormatyyyy_MM_dd_EEEE_HH_mm_ss = new DateFormat('yyyy-MM-dd EEEE HH:mm:ss');

var g_userId;
var g_userEmail;

Future <String> getcurrentuserdata() async {
  User user = await FirebaseAuth.instance.currentUser;
  if(user != null){
    g_userId = user.uid;
    g_userEmail = user.email;
  }else{
    g_userId = '';
    g_userEmail = '';
  }
}