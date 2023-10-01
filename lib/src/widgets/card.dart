import 'package:autonomit/src/models/device_group_model.dart';
import 'package:autonomit/src/widgets/device_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BigCard extends StatelessWidget {
  const BigCard({required this.index, required this.stateData});
  final int index;
  final stateData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
      child: Column(
        children: [
          Text(
            stateData[index]['name'].toString(),
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Card(
            elevation: 0,
            child:
                DeviceStatus(index: index, states: stateData[index]['states']),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: theme.cardColor,
          boxShadow: [
            BoxShadow(
                color: switch (Provider.of<DeviceGroupModel>(context)
                    .setShadowColor(index)
                    .toString()) {
                  '0' => Colors.redAccent,
                  '1' => Colors.orangeAccent,
                  '2' => Colors.greenAccent,
                  _ => Colors.greenAccent,
                },
                blurRadius: 6.0,
                blurStyle: BlurStyle.outer),
          ]),
    );
  }
}
