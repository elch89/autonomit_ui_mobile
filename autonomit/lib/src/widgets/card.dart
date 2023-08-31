import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyLarge;
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            data.toString(),
            style: style,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: theme.cardColor,
          boxShadow: [
            this.key != null
                ? BoxShadow(
                    color: Colors.redAccent,
                    blurRadius: 6.0,
                    blurStyle: BlurStyle.outer)
                : BoxShadow(),
          ]),
    );
  }
}
