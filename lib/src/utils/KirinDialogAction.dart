import 'package:flutter/material.dart';
import 'package:kirin/src/constants/KirinTextConstants.dart';

class KirinDialogAction extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  KirinDialogAction(this.text, {this.onPressed, Key key})
      : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed,
        disabledElevation: 0,
        highlightElevation: 0,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: FontSize.medium,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
