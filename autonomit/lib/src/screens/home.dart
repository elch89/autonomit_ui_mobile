import 'dart:math';

import 'package:autonomit/src/widgets/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final minWidth = 500.0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/settings')},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: min(screenWidth, minWidth),
          ),
          child: ListView(
            padding: EdgeInsets.all(30.0),
            children: <Widget>[
              BigCard(),
              BigCard(),
              BigCard(),
              BigCard(),
              BigCard(),
              BigCard(),
            ],
          ),
        ),
      ),
    );
  }
}
