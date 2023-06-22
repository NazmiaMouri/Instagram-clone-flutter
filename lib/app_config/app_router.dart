import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screens/auth/login.dart';
import 'package:instagram_clone_flutter/screens/home/home.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => const Login());

      case '/home':
      return MaterialPageRoute(builder: (context) => const Home());

      default:
       return  _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: Container(
                  child: const Center(
                child: Text( "Please try again"),
              )),
            ));
  }
}
