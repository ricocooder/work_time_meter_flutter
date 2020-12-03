import 'package:flutter/material.dart';

class CustomCardTwoLine extends StatelessWidget {
  const CustomCardTwoLine(
      {Key key,
        @required this.firstText,
        @required this.secondText})
      : super(key: key);
  final String firstText;
  final secondText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: secondText != null ? Text(
          '$firstText: $secondText',
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ) : Text(
          '$firstText: ',
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
      ),
    );
  }
}