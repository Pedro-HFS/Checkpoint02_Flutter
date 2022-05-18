import 'package:flutter/material.dart';
import 'package:pedro_sir/pages/list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
