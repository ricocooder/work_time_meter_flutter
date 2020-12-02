

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:work_time_meter_flutter/auth.dart';
import 'package:work_time_meter_flutter/screens/counter.dart';
import 'package:work_time_meter_flutter/screens/login.dart';
import 'package:work_time_meter_flutter/show_nessage.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        _authStatus = userId == null? AuthStatus.notSignIn : AuthStatus.signIn;
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
          return LoginScreen(auth: widget.auth);
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
