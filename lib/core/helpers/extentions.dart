import 'package:flutter/material.dart';

extension NavigationTo on BuildContext {
  Future<dynamic> push(Widget widget) {
    return Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  Future<dynamic> pushReplacement(Widget widget) {
    return Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  Future<dynamic> pushAndRemove(Widget widget) {
    return Navigator.of(this)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget),
            (route) => false);
  }
}
