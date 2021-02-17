import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/material/RawMaterialButton-class.html

class Button extends StatelessWidget {
  final String text;
  final bool disabled;
  final VoidCallback onPressed;

  Button(this.text, {this.disabled = false, this.onPressed, Key key})
      : assert(text != null),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        splashColor: Colors.transparent,
        fillColor: disabled ? Colors.grey.shade300 : Colors.green.shade700,
        child: Text(text,
            style: TextStyle(
                color: disabled ? Colors.grey.shade500 : Colors.white,
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
