import 'package:flutter/material.dart';

class Navigation {
  static push(BuildContext context, Widget widget) {
    Route route = MaterialPageRoute(builder: (context) => widget);
    Navigator.push(context, route);
  }

  static pushandRemoveUntil(BuildContext context, Widget widget) {
    Route route = MaterialPageRoute(builder: (context) => widget);
    Navigator.pushAndRemoveUntil(
      context,
      route,
      (route) => false,
    );
  }

  static replace(BuildContext context, Widget widget) {
    Route route = MaterialPageRoute(builder: (context) => widget);
    Navigator.pushReplacement(context, route);
  }

  static pushNewRoute(BuildContext context, Widget widget) {
    Route route = MaterialPageRoute(builder: (context) => widget);
    Navigator.of(context, rootNavigator: true).push(route);
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static popUntil(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static waitAndPush(BuildContext context, Widget widget,
      {pushOnly = true}) async {
    await Future.delayed(const Duration(milliseconds: 1700));
    Route route = MaterialPageRoute(builder: (context) => widget);
    pushOnly
        // ignore: use_build_context_synchronously
        ? Navigator.push(context, route)
        // ignore: use_build_context_synchronously
        : Navigator.pushReplacement(context, route);
  }
}
