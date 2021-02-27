import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/material/RawMaterialButton-class.html

class KirinButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final VoidCallback onPressed;

  KirinButton(
    this.text, {
    this.disabled = false,
    this.onPressed,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RawMaterialButton(
        onPressed: disabled ? null : onPressed,
        disabledElevation: 0,
        highlightElevation: 0,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        splashColor: Colors.transparent,
        fillColor: disabled ? Colors.grey.shade300 : Colors.green.shade600,
        child: Text(
          text,
          style: TextStyle(
            color: disabled ? Colors.grey.shade500 : Colors.white,
            fontFamily: 'Nunito Sans',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
