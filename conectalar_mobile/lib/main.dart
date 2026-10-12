
import 'package:flutter/material.dart';
import 'features/auth/login_page.dart';
import 'features/home/home_page.dart';

void main() { runApp(ConectaLarApp()); }

class ConectaLarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConectaLar',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (c) => LoginPage(),
        '/home': (c) => HomePage(),
      },
    );
  }
}
