import 'package:flutter/material.dart';

enum KirinToastStatus { loading, success }

class KirinToast {
  final BuildContext context;
  final String text;
  final KirinToastStatus icon;

  KirinToast(this.context, this.text, this.icon);

  Widget getIconWidget() {
    switch (icon) {
      case KirinToastStatus.loading:
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case KirinToastStatus.success:
        return Icon(
          Icons.check_rounded,
          color: Colors.white,
          size: 50,
          semanticLabel: 'Success icon',
        );
        break;
    }
  }

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
                getIconWidget(),
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

  Future<void> pop({int durationSeconds = 1}) async {
    show();
    return Future.delayed(
      Duration(
        seconds: durationSeconds,
      ),
      () => hide(),
    );
  }
}
