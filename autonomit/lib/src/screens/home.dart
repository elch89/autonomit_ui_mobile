import 'dart:math';

// import 'package:autonomit/src/utilities/device_group.dart';
import 'package:autonomit/src/widgets/card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:autonomit/src/providers/mock_data.dart';

String jsonMockData = jsonEncode(deviceGroupMockData);
Map<String, dynamic> mockData = jsonDecode(jsonMockData);

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final minWidth = 500.0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var listSize = mockData['totalElements'];
    // DeviceGroup dg = new DeviceGroup(data: mockData['content']);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/settings')},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: min(screenWidth, minWidth),
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(30.0),
              itemCount: listSize + 1,
              itemBuilder: (context, int index) => BigCard(
                index: index,
              ),
            )),
      ),
    );
  }
}
