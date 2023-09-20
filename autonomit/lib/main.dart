import 'package:autonomit/src/screens/home.dart';
import 'package:autonomit/src/screens/settings.dart';
import 'package:autonomit/src/models/device_group_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/constants/autonomit_color_scheme.dart';

void main() {
  runApp(const Autonomit());
}

class Autonomit extends StatelessWidget {
  const Autonomit({super.key});
  @override
  Widget build(BuildContext context) {
    // Preload images when the app starts
    preloadImages(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => DeviceGroupModel(),
      child: MaterialApp(
        title: 'Autonomit',
        theme: AutonomitColorScheme.defaultTheme,
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomePage(),
          '/settings': (context) => SettingsPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  // Preload images using the precacheImage method
  void preloadImages(BuildContext context) {
    final List<String> assetPaths = [
      'assets/images/state/status-plate-alert.png',
      'assets/images/misc/status_plate.png',
      'assets/images/state/round-0.png',
      'assets/images/state/round-1.png',
      'assets/images/state/round-2.png',
      'assets/images/state/status-plate-warn.png',
      'assets/images/state/status-plate-okey.png',
      'assets/images/state/card-alert.png',
      'assets/images/state/card-warn.png',
      'assets/images/state/card-okey.png',
    ];

    for (String assetPath in assetPaths) {
      precacheImage(AssetImage(assetPath), context);
    }
  }
}
