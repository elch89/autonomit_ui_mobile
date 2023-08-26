import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyLarge;
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 12.0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'Testing',
          style: style,
        ),
      ),
    );
  }
}
