import 'dart:async';

import 'package:flutter/widgets.dart';

class ScreenDimensions {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Future<double> getImageHeight(
      BuildContext context, ImageProvider imageProvider) async {
    final completer = Completer<double>();

    final imageStream = imageProvider.resolve(ImageConfiguration());
    imageStream.addListener(ImageStreamListener((ImageInfo info, bool _) {
      final imageHeight = info.image.height.toDouble();
      completer.complete(imageHeight);
    }));

    return completer.future;
  }
}
