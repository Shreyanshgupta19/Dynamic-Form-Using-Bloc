import 'package:flutter/material.dart';
import 'package:flutter_4a/item_app_screen/form_app_screen.dart';
// import '../Screen/HomePage/HomePage.dart';


class Routes {
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/FormAppScreen':
        return MaterialPageRoute(builder: (context) => const FormAppScreen());

      default:
        return null;
    }
  }
}
