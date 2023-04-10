import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ux/page/home_page.dart';

class BaldyDashApp extends StatelessWidget {
  const BaldyDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}
