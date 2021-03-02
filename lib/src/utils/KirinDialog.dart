import 'package:flutter/material.dart';
import 'package:kirin/src/constants/KirinTextConstants.dart';
import 'package:kirin/src/utils/KirinDialogAction.dart';

class KirinDialog {
  final BuildContext context;
  final String title;
  final String description;
  final List<KirinDialogAction> actions;

  KirinDialog(
    this.context,
    this.title,
    this.description,
    this.actions,
  );

  Widget getActionsWidget() {
    List<Widget> list = [];

    Widget divider = (actions.length > 2)
        ? (Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            height: 1,
          ))
        : (VerticalDivider(
            color: Colors.grey.shade200,
            thickness: 1,
            width: 1,
          ));

    for (var i = 0; i < (actions.length); i++) {
      list.add(actions[i]);
      // skip the last divider
      if (i != actions.length - 1) {
        list.add(divider);
      }
    }

    return (actions.length > 2)
        ? Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: list)
        : Row(children: list);
  }

  Future<Widget> show() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 280.0,
            decoration: BoxDecoration(
              color: FontColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: FontColor.lightGrey,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontFamily: 'Nunito Sans',
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          description,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: FontColor.darkGrey,
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(child: getActionsWidget())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
