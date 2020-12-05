

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:work_time_meter_flutter/auth_privider.dart';
import 'package:work_time_meter_flutter/globals.dart';
import 'package:work_time_meter_flutter/screens/counter.dart';
import 'package:work_time_meter_flutter/screens/login.dart';
import 'package:work_time_meter_flutter/show_nessage.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notSignIn,
  signIn
}

class _RootPageState extends State<RootPage> {

  AuthStatus _authStatus = AuthStatus.notSignIn;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var auth = AuthProvider.of(context).auth;
    auth.currentUserr().then((userUID) {
      setState(() {
       _authStatus = userUID == null ? AuthStatus.notSignIn : AuthStatus.signIn;
       getcurrentuserdata();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus){
      case AuthStatus.notSignIn:
        {

          showUserMessageByToast(
              displayedText: 'User not recognized',
              toastTimeDisplay: Toast.LENGTH_LONG,
              messageGravity: ToastGravity.BOTTOM,
              textColor: Colors.red,
              backgroundColor: Colors.white,
              fontsize: 15);
          return LoginScreen();
        }
      case AuthStatus.signIn:

        {
          showUserMessageByToast(
              displayedText: 'User recognized',
              toastTimeDisplay: Toast.LENGTH_LONG,
              messageGravity: ToastGravity.BOTTOM,
              textColor: Colors.red,
              backgroundColor: Colors.white,
              fontsize: 15);
          return CounterScreenBegin();
        }
    }

  }
}
