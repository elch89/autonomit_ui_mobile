import 'package:autonomit/src/screens/home.dart';
import 'package:autonomit/src/screens/settings.dart';
import 'package:flutter/material.dart';
import './src/colors/autonomit_color_scheme.dart';

void main() {
  runApp(const Autonomit());
}

class Autonomit extends StatelessWidget {
  const Autonomit({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autonomit',
      theme: AutonomitColorScheme.defaultTheme,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
