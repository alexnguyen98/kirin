import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingToast {
  LoadingToast(this.context);

  final BuildContext context;

  void show(String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 15),
                  Text(text,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
          );
        });
  }

  void hide() {
    Navigator.of(context).pop();
  }
}
