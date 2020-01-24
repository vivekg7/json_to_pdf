import 'package:flutter/material.dart';

class NavigationUtil {

  NavigationUtil._();

  static void showBlockingDialog(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(child: Center(child: CircularProgressIndicator(),),);
      }
    );
  }

  static void dismissBlockingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

}