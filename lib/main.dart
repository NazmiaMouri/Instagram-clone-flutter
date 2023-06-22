import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screens/auth/login.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone_flutter/screens/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MaterialApp(home: Login(), debugShowCheckedModeBanner: false, routes: routes));
}

final routes = {
  Home.tag: (context) => const Home(),
};
