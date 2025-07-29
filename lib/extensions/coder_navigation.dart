import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  /// Pushes a new screen onto the stack
  Future<T?> push<T>(Widget page) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Pushes a new screen and removes all previous routes
  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// Pushes a new screen and replaces the current one
  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Pops the current screen
  void pop<T extends Object?>([T? result]) {
    Navigator.pop<T>(this, result);
  }

  /// Pops until a certain route is reached
  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.popUntil(this, predicate);
  }

  /// Checks if we can pop
  bool canPop() => Navigator.canPop(this);
}
