import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/material/RawMaterialButton-class.html

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: RawMaterialButton(
          onPressed: () {},
          disabledElevation: 0,
          highlightElevation: 0,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          splashColor: Colors.transparent,
          fillColor: Colors.green.shade700,
          child: Text("suck it",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
