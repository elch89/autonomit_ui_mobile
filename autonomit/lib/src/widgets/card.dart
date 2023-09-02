import 'package:autonomit/src/models/device_group.dart';
import 'package:autonomit/src/widgets/device_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BigCard extends StatelessWidget {
  const BigCard({this.index});
  final index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // print(index);
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
      child: Column(
        children: [
          index == 0
              ? Text(
                  'All',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              : Text(
                  Provider.of<DeviceGroupModel>(context)
                      .getDeviceName(index - 1),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
          Card(
            elevation: 0,
            child: DeviceStatus(
              index: index,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: theme.cardColor,
          boxShadow: [
            index == 0
                ? BoxShadow(
                    color: switch (Provider.of<DeviceGroupModel>(context)
                        .getMaxIndex()
                        .toString()) {
                      '0' => Colors.redAccent,
                      '1' => Colors.orangeAccent,
                      '2' => Colors.greenAccent,
                      _ => Colors.redAccent,
                    },
                    blurRadius: 6.0,
                    blurStyle: BlurStyle.outer)
                : BoxShadow(),
          ]),
    );
  }
}
