import 'package:flutter/material.dart';
import 'package:kirin/src/constants/KirinTextConstants.dart';

// TODO: centralise text style
// https://api.flutter.dev/flutter/widgets/Text-class.html

class KirinHeading extends StatelessWidget {
  final String text;

  KirinHeading(this.text, {Key key})
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
          letterSpacing: -0.5,
          fontFamily: 'Nunito Sans',
          fontSize: FontSize.extraLarge,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
