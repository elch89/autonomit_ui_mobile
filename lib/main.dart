import 'dart:developer';
import 'dart:io';

import 'package:autonomit/src/screens/home.dart';
import 'package:autonomit/src/screens/settings.dart';
import 'package:autonomit/src/models/device_group_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/constants/autonomit_color_scheme.dart';
import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_io.dart' as io;
import 'package:url_launcher/url_launcher.dart';

Future<Credential> authenticate(Client client,
    {List<String> scopes = const []}) async {
  // create a function to open a browser with an url
  urlLauncher(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri) || Platform.isAndroid) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  // create an authenticator
  var authenticator = io.Authenticator(client,
      scopes: scopes, port: 4000, urlLancher: urlLauncher);

  // starts the authentication
  var c = await authenticator.authorize();

  // close the webview when finished
  if (Platform.isAndroid || Platform.isIOS) {
    closeInAppWebView();
  }

  return c;
}

Future<Credential?> getRedirectResult(Client client,
    {List<String> scopes = const []}) async {
  return null;
}

const keycloakUri = 'https://172.27.5.179/autonomit_keycloak/realms/Autonomit';
const scopes = ['profile'];

Credential? credential;

late final Client client;

Future<Client> getClient() async {
  try {
    var uri = Uri.parse(keycloakUri);
    if (!kIsWeb && Platform.isAndroid) uri = uri.replace(host: '10.0.2.2');
    var clientId = 'pinggui';
    var issuer = await Issuer.discover(uri);
    return Client(issuer, clientId);
  } catch (e) {
    rethrow;
  }
}

void main() async {
  //"https://172.27.5.179/autonomit_keycloak". Realm: "Autonomit". Client: "pinggui"
  // client = await getClient();
  // credential = await getRedirectResult(client, scopes: scopes);
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
