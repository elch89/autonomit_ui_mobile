import 'package:flutter/material.dart';

class DeviceStatus extends StatelessWidget {
  final int index;
  final List<int> states;

  DeviceStatus({required this.index, required this.states});

  @override
  Widget build(BuildContext context) {
    final statusPlateImages = [
      'assets/images/state/status-plate-alert.png',
      'assets/images/state/status-plate-warn.png',
      'assets/images/state/status-plate-okey.png',
    ];
    final singleStatusPlateImages = [
      'assets/images/state/card-alert.png',
      'assets/images/state/card-warn.png',
      'assets/images/state/card-okey.png',
    ];
    final dimensions = states.where((state) => state > 0).length.toDouble();
    // extracting dimanicly failed using future function used actual dimensions instead
    var circleHeight = 65;
    var statusPlateWidth = 305;

    var isStatusSet = false;
    final roundImages = <Widget>[];
    final singleStatusPlateImage = 'assets/images/state/card-okey.png';

    void addRoundImage(int idx, int state) {
      final statusCount = Positioned(
          bottom: (circleHeight / dimensions),
          child: Text(
            state.toString(),
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ));
      final roundImage = Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/state/round-$idx.png',
            width: statusPlateWidth / dimensions,
          ),
          statusCount,
        ],
      );

      roundImages.add(roundImage);
    }

    Image statusPlate = Image.asset('assets/images/misc/status_plate.png');
    Image singleStatusPlate = statusPlate;
    /**Iterate through list of states and add UI conditionaly */
    for (var idx = 0; idx < states.length; idx++) {
      final state = states[idx];

      if (state > 0) {
        if (!isStatusSet) {
          isStatusSet = true;
          final statusPlateImage = statusPlateImages[idx];
          statusPlate = Image.asset(statusPlateImage);
        }

        addRoundImage(idx, state);
      }
    }
    if (roundImages.length == 1) {
      singleStatusPlate = Image.asset(
          singleStatusPlateImages[states.indexWhere((state) => state > 0)]);
    } else if (roundImages.isEmpty) {
      singleStatusPlate = Image.asset(singleStatusPlateImage);
    }
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Stack(
            alignment: AlignmentDirectional.center,
            children: (roundImages.length > 1)
                ? [
                    Positioned(
                      child: statusPlate,
                    ),
                    Positioned(
                      bottom: 20.0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: roundImages),
                    )
                  ]
                : [
                    Positioned(
                      child: singleStatusPlate,
                    ),
                    Positioned(
                      child: Text(
                        roundImages.length == 1
                            ? states.where((state) => state > 0).join('')
                            : '0',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      bottom: 60,
                    )
                  ]));
  }
}
