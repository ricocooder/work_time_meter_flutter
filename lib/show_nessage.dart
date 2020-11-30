import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// showUserMessageByToast(
// 'Support has been called',
// ToastGravity.BOTTOM,
// Colors.black,
// Colors.white,
// 15);

showUserMessageByToast(
    {@required String displayedText,
      @required Toast toastTimeDisplay,
      @required ToastGravity messageGravity,
      @required Color textColor,
      @required Color backgroundColor,
      @required int fontsize}) {
  Fluttertoast.showToast(
      msg: displayedText,
      toastLength: toastTimeDisplay,
      timeInSecForIosWeb: 1,
      gravity: messageGravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 15);
  print('taped Change status');
}
