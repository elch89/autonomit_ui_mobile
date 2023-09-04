import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:autonomit/src/providers/mock_data.dart';

String jsonMockData = jsonEncode(deviceGroupMockData);

class DeviceGroupModel extends ChangeNotifier {
  Map<String, dynamic> _mockData = jsonDecode(jsonMockData);
  List<List<dynamic>> statesList = [];
  DeviceGroupModel() {
    getAllStates();
  }
  // returns list of al states array in content
  List getAllStates() {
    if (statesList.length > 0) {
      return statesList;
    }
    statesList.add(getTotalAnalytics());
    for (var element in _mockData['content']) {
      statesList.add(element['states']);
    }

    return statesList;
    // notifyListeners(); // to update state in the future development
  }

//get states array of given content
  List getStates(int index) {
    return statesList[index];
  }

// get the device name
  String getDeviceName(int index) {
    return _mockData['content'][index]['name'];
  }

// Addition of al states in content list
  List getTotalAnalytics() {
    List totalAnalytics = [0, 0, 0];
    for (int j = 0; j < 3; j++) {
      for (int i = 0; i < _mockData['content'].length; i++) {
        totalAnalytics[j] += _mockData['content'][i]['states'][j];
      }
    }
    return totalAnalytics;
  }

  int setShadowColor(int index) {
    List ls = getStates(index);
    for (var i = 0; i < ls.length; i++) {
      if (ls[i] > 0) {
        return i;
      }
    }
    return -1;
  }

  int getStatus(int idx) {
    var status = 0;
    var size = getStates(idx).length;
    var currentStates = getStates(idx);
    for (var i = 0; i < size; i++) {
      if (currentStates[i] > 0) {
        status = currentStates[i];
      }
    }
    return status;
  }

  double countNonZeroStates(List states) {
    double counter = 0.0;
    for (var i = 0; i < states.length; i++) {
      if (states[i] > 0) {
        counter += 1;
      }
    }
    return counter;
  }
}
