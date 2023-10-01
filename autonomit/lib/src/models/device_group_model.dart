import 'package:autonomit/main.dart';
import 'package:autonomit/src/providers/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';

class DeviceGroupModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _mockData = deviceGroupMockData;
  late List<Map<String, dynamic>> _statesList = [];
  late int currentPage, totalPages, pageSize, totalElements, listLength;
  UserInfo? _userInfo;

  DeviceGroupModel() {
    // initKeycloakService();
    this.currentPage = _mockData[0]['number'];
    this.totalPages = _mockData[currentPage - 1]['totalPages'];
    this.totalElements = _mockData[currentPage - 1]['totalElements'];
    this.pageSize = _mockData[currentPage - 1]['numberOfElements'];
    this.listLength = _mockData[currentPage - 1]['numberOfElements'];
    for (var el in _mockData[currentPage - 1]['content']) {
      this._statesList.add({'name': el['name'], 'states': el['states']});
    }
  }
  void initKeycloakService() {
    if (credential != null) {
      credential?.getUserInfo().then((userInfo) {
        this._userInfo = userInfo;
        notifyListeners();
      });
    }
  }

  // getters
  get userInfo => _userInfo;
  List<Map<String, dynamic>> get statesList => _statesList;
  set setUserInfo(UserInfo userInfo) {
    this._userInfo = userInfo;
    notifyListeners();
  }

  void loadNextPage() {
    if (currentPage >= totalPages) {
      return;
    }
    currentPage++;
    listLength += _mockData[currentPage - 1]['numberOfElements'] as int;
    _mockData[currentPage - 1]['content'].forEach((el) =>
        this._statesList.add({'name': el['name'], 'states': el['states']}));
    notifyListeners();
  }

  void loadFirstPage() {
    if (currentPage == 1) {
      return;
    }
    currentPage = 1;
    this._statesList.removeRange(
        _mockData[currentPage - 1]['numberOfElements'] as int, listLength);
    listLength = _mockData[currentPage - 1]['numberOfElements'] as int;
    notifyListeners();
  }

  int setShadowColor(int index) {
    List ls = statesList[index]['states'];
    for (var i = 0; i < ls.length; i++) {
      if (ls[i] > 0) {
        return i;
      }
    }
    return -1;
  }
}
