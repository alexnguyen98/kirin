import 'package:flutter/material.dart';
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

  List<Widget> getActions() {
    List<Widget> list = [];
    for (var i = 0; i < (actions.length); i++) {
      list.add(actions[i]);
      // skip the last divider
      if (i != actions.length - 1) {
        list.add(
          VerticalDivider(
            color: Colors.grey.shade200,
            thickness: 1,
            width: 1,
          ),
        );
      }
    }
    return list;
  }

  Future<Widget> show() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _ctx) {
        return Center(
          child: Container(
            width: 280.0,
            decoration: BoxDecoration(
              color: Colors.white,
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
                          color: Colors.grey.shade200,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          description,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: getActions(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
