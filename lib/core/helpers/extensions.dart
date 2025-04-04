import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.pop(this);
}


// GoRouter Extension

/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterNavigation on BuildContext {
  void goTo(String routeName, {Object? extra}) {
    GoRouter.of(this).go(routeName, extra: extra);
  }

  void pushTo(String routeName, {Object? extra}) {
    GoRouter.of(this).push(routeName, extra: extra);
  }

  void pushReplacementTo(String routeName, {Object? extra}) {
    GoRouter.of(this).pushReplacement(routeName, extra: extra);
  }

  void goAndRemoveUntil(String routeName, {Object? extra}) {
    GoRouter.of(this).go(routeName, extra: extra);
  }

  void pop() => GoRouter.of(this).pop();
}
*/