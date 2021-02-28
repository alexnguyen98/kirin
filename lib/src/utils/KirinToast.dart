import 'package:flutter/material.dart';

class KirinToast {
  final BuildContext context;
  final String text;

  KirinToast(this.context, this.text);

  Future<Widget> show() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext _ctx) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade900.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(height: 15),
                Text(
                  text,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontFamily: 'Nunito Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void hide() {
    Navigator.of(context).pop();
  }

  Future<void> pop({int durationSeconds = 3}) async {
    show();
    return Future.delayed(
      Duration(
        seconds: durationSeconds,
      ),
      () => hide(),
    );
  }
}
