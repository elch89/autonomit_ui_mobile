import 'package:autonomit/src/models/device_group.dart';
import 'package:flutter/material.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter/file_input.dart';
import 'dart:io';

import 'package:provider/provider.dart';

int getImageDimensions(File file) {
  final size = ImageSizeGetter.getSize(FileInput(file));
  if (size.needRotate) {
    final width = size.height;
    return width;
  } else {
    return size.width;
  }
}

class DeviceStatus extends StatelessWidget {
  DeviceStatus({required this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    Image statusImage = Image.asset('assets/images/misc/status_plate.png');
    if (index == 0) {
      int maxIndex = Provider.of<DeviceGroupModel>(context).getMaxIndex();
      switch (maxIndex) {
        case 0:
          statusImage =
              Image.asset('assets/images/state/status-plate-alert.png');

          break;
        case 1:
          statusImage =
              Image.asset('assets/images/state/status-plate-warn.png');
          break;
        case 2:
          statusImage =
              Image.asset('assets/images/state/status-plate-okey.png');
          break;
        default:
          statusImage = Image.asset('assets/images/misc/status_plate.png');
      }
    } else if (index > 0) {
      switch (
          Provider.of<DeviceGroupModel>(context).getStatusIndex(index - 1)) {
        case 0:
          statusImage = Image.asset('assets/images/state/card-alert.png');
          break;
        case 1:
          statusImage = Image.asset('assets/images/state/card-warn.png');
          break;
        case 2:
          statusImage = Image.asset('assets/images/state/card-okey.png');
          break;
        default:
          statusImage = Image.asset('assets/images/misc/status_plate.png');
      }
    }
    var plateWidth =
        getImageDimensions(File('assets/images/misc/status_plate.png'))
            .toDouble();
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Stack(
            alignment: AlignmentDirectional.center,
            children: ((index > 0)
                ? [
                    Positioned(
                      child: statusImage,
                    ),
                    Positioned(
                      child: Text(
                        Provider.of<DeviceGroupModel>(context)
                            .getStatus(index - 1)
                            .toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      bottom: 60.0,
                    )
                  ]
                : [
                    Positioned(
                      child: statusImage,
                    ),
                    Positioned(
                      width: plateWidth,
                      bottom: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(alignment: Alignment.center, children: [
                            Image(
                              width: plateWidth / 3.1,
                              image:
                                  AssetImage('assets/images/state/round-0.png'),
                            ),
                            Text(
                              Provider.of<DeviceGroupModel>(context)
                                  .getTotalAnalytics()[0]
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ]),
                          Stack(alignment: Alignment.center, children: [
                            Image(
                              width: plateWidth / 3.1,
                              image:
                                  AssetImage('assets/images/state/round-1.png'),
                            ),
                            Text(
                              Provider.of<DeviceGroupModel>(context)
                                  .getTotalAnalytics()[1]
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ]),
                          Stack(alignment: Alignment.center, children: [
                            Image(
                              width: plateWidth / 3.1,
                              image:
                                  AssetImage('assets/images/state/round-2.png'),
                            ),
                            Text(
                              Provider.of<DeviceGroupModel>(context)
                                  .getTotalAnalytics()[2]
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ]),
                        ],
                      ),
                    )
                  ])));
  }
}
