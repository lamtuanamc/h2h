import 'package:example_hack2hire/page/list_seats_screen.dart';
import 'package:example_hack2hire/page/shows_screen.dart';
import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowsScreen(),
    );
  }
}
