import 'package:flutter/material.dart';

class CustomCardOneLine extends StatelessWidget {
  CustomCardOneLine({@required this.firstText,});
  final String firstText;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    // final fontsize = mediaQuery.size.height * 0.023;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Colors.grey[800],
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
        child: Text(
          '$firstText',
//          maxLines: 1,
          style: TextStyle(color: Colors.white,
              // fontSize: fontsize
          ),
        ),
      ),
    );
  }
}
