import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:autonomit/src/providers/mock_data.dart';

String jsonMockData = jsonEncode(deviceGroupMockData);

class DeviceGroupModel extends ChangeNotifier {
  Map<String, dynamic> _mockData = jsonDecode(jsonMockData);
  List<List<dynamic>> statesList = [];

  // returns list of al states array in content
  void getAllStates() {
    if (statesList.length > 0) {
      return;
    }
    for (var element in _mockData['content']) {
      statesList.add(element['states']);
    }
    notifyListeners(); // to update state in the future development
  }

//get states array of given content
  List getStates(int index) {
    return List.of(_mockData['content'][index]['states']);
  }

// get the device name
  String getDeviceName(int index) {
    return _mockData['content'][index]['name'];
  }

// Addition of al states in content list
  List<num> getTotalAnalytics() {
    List<num> totalAnalytics = [0, 0, 0];
    for (int j = 0; j < 3; j++) {
      for (int i = 0; i < _mockData['content'].length; i++) {
        totalAnalytics[j] += _mockData['content'][i]['states'][j];
      }
    }
    return totalAnalytics;
  }

  int getMaxIndex() {
    List ls = getTotalAnalytics();
    int max = 0;
    int maxIndex = 0;
    for (var i = 0; i < ls.length; i++) {
      if (ls[i] > max) {
        max = ls[i];
        maxIndex = i;
        return maxIndex;
      }
    }
    return maxIndex;
  }

  // examples: [0,1,0] => 1, [1,0,0] => 0
  int getStatus(int idx) {
    var status = 0;
    var size = _mockData['content'][idx]['states'].length;
    var currentStates = _mockData['content'][idx]['states'];
    for (var i = 0; i < size; i++) {
      if (currentStates[i] > 0) {
        status = currentStates[i];
      }
    }
    return status;
  }

  int getStatusIndex(int idx) {
    var status = 0;
    var size = _mockData['content'][idx]['states'].length;
    var currentStates = _mockData['content'][idx]['states'];
    for (var i = 0; i < size; i++) {
      if (currentStates[i] > 0) {
        status = i;
      }
    }
    return status;
  }
}
