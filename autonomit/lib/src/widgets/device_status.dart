import 'package:autonomit/src/models/device_group.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DeviceStatus extends StatelessWidget {
  DeviceStatus({required this.index, this.plateWidth = 200});
  final double plateWidth;
  final index;
  @override
  Widget build(BuildContext context) {
    List states = Provider.of<DeviceGroupModel>(context).getStates(index);
    Map<int, Widget> roundImages = {};
    Image statusPlate = Image.asset('assets/images/misc/status_plate.png');
    Image singleStatusPlate =
        Image.asset('assets/images/misc/status_plate.png');
    //divider for image width set by amount of non zero states
    double dimensions =
        Provider.of<DeviceGroupModel>(context).countNonZeroStates(states);

    bool isStatusSet = false;
    /**Iterate through list of states and add UI conditionaly */
    states.asMap().entries.toList().forEach((entry) {
      int idx = entry.key;
      int state = entry.value;

      if (state > 0) {
        /**
         * State in states list has a value: add circles+text to '@roundImages' dictionery 
         * depending on state and status card representing it. 
         * Plate status is decided by most severe error '@isStatusSet'
        */
        switch (idx) {
          case 0:
            isStatusSet = true;
            statusPlate =
                Image.asset('assets/images/state/status-plate-alert.png');
            roundImages.addAll({
              idx: Stack(alignment: Alignment.center, children: [
                Image.asset(
                  'assets/images/state/round-0.png',
                  width: plateWidth / dimensions,
                ),
                Text(
                  state.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ])
            });
            break;
          case 1:
            if (!isStatusSet) {
              isStatusSet = true;
              statusPlate =
                  Image.asset('assets/images/state/status-plate-warn.png');
            }
            roundImages.addAll({
              idx: Stack(alignment: Alignment.center, children: [
                Image.asset(
                  'assets/images/state/round-1.png',
                  width: plateWidth / dimensions,
                ),
                Text(
                  state.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ])
            });
            break;
          case 2:
            if (!isStatusSet) {
              isStatusSet = true;
              statusPlate =
                  Image.asset('assets/images/state/status-plate-okey.png');
            }
            roundImages.addAll({
              idx: Stack(alignment: Alignment.center, children: [
                Image.asset(
                  'assets/images/state/round-2.png',
                  width: plateWidth / dimensions,
                ),
                Text(
                  state.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ])
            });
            break;
          default:
        }
      }
    });
    /**if only one state is available use respective status card */
    if (roundImages.length == 1) {
      switch (roundImages.keys.first) {
        case 0:
          singleStatusPlate = Image.asset('assets/images/state/card-alert.png');
          break;
        case 1:
          singleStatusPlate = Image.asset('assets/images/state/card-warn.png');
          break;
        case 2:
          singleStatusPlate = Image.asset('assets/images/state/card-okey.png');
          break;
        default:
      }
    }
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Stack(
            alignment: AlignmentDirectional.center,
            children: (roundImages.length == 1)
                ? [
                    Positioned(
                      child: singleStatusPlate,
                    ),
                    Positioned(
                      child: Text(
                        Provider.of<DeviceGroupModel>(context)
                            .getStatus(index)
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
                      child: statusPlate,
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: roundImages.values.toList()),
                    )
                  ]));
  }
}
