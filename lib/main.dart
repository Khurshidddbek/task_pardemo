import 'package:flutter/material.dart';
import 'package:task_pardemo/pages/detail_page.dart';
import 'package:task_pardemo/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Parsing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        DetailPage.id: (context) => DetailPage(),
      },
    );
  }
}