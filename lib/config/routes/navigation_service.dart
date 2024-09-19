import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  push(String route, {Object? arguments}) {
    Navigator.of(navigatorKey.currentContext!).pushNamed(route, arguments: arguments);
  }

  pop() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  getContext() {
    return navigatorKey.currentContext;
  }
}