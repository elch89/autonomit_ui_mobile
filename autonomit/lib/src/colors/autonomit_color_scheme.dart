import 'package:flutter/material.dart';

// Add more theme colors here:
const PrimaryColorBg = const Color(0xFF252531);
const PrimaryColorFg = const Color(0xFF6883CC);

const SecondaryColorBg = const Color(0xFF201E2B);
const SecondaryColorFg = const Color(0xFF263c75);

const TextColorPrimary = const Color(0xFFffffff);
const TextColorSecondery = const Color(0xFF666666);

class AutonomitColorScheme {
  static final ThemeData defaultTheme = _buildColorScheme();

  static ThemeData _buildColorScheme() {
    final ThemeData base = ThemeData.light();
    // Edit theme properties
    return base.copyWith(
      primaryColor: PrimaryColorBg,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: PrimaryColorFg,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: base.appBarTheme
          .copyWith(backgroundColor: PrimaryColorBg, elevation: 0),
      scaffoldBackgroundColor: PrimaryColorBg,
      cardColor: SecondaryColorBg,
      textTheme: base.textTheme.copyWith(
          titleLarge:
              base.textTheme.titleLarge?.copyWith(color: TextColorPrimary),
          bodyLarge:
              base.textTheme.bodyLarge?.copyWith(color: TextColorPrimary),
          bodyMedium:
              base.textTheme.bodyMedium?.copyWith(color: TextColorSecondery)),
    );
  }
}
