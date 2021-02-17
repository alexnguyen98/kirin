import 'package:flutter/material.dart';

//https://api.flutter.dev/flutter/widgets/Text-class.html

class Heading extends StatelessWidget {
  final String text;

  Heading(this.text, {Key key})
      : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.w800),
        ));
  }
}
