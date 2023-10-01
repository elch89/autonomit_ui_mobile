import 'dart:math';
import 'package:autonomit/main.dart';
import 'package:autonomit/src/constants/dimensions.dart';
import 'package:autonomit/src/models/device_group_model.dart';
import 'package:autonomit/src/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final minWidth = 500.0;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // void _login() async {
    //   var credential = await authenticate(client, scopes: scopes);
    //   var userInfo = await credential.getUserInfo();
    //   Provider.of<DeviceGroupModel>(context, listen: false).setUserInfo =
    //       userInfo;
    // }
    // void _signOut()async{
    //   Provider.of<DeviceGroupModel>(context, listen: false).setUserInfo =null;
    // }

    dynamic listSize = Provider.of<DeviceGroupModel>(context).listLength;
    _controller.addListener(() {
      double maxScroll = _controller.position.maxScrollExtent;
      double minScroll = _controller.position.minScrollExtent;
      double currentScroll = _controller.position.pixels;
      if (maxScroll == currentScroll) {
        Provider.of<DeviceGroupModel>(context, listen: false).loadNextPage();
      } else if (minScroll == currentScroll) {
        Provider.of<DeviceGroupModel>(context, listen: false).loadFirstPage();
      }
    });
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
              maxWidth: min(ScreenDimensions.screenWidth(context), minWidth),
            ),
            child:
                /* (Provider.of<DeviceGroupModel>(context).userInfo ==
                    null)
                ? ElevatedButton(
                    onPressed: _login,
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )
                :  */
                // To sign out
                Column(
              //userInfo!.name || userInfo!.email => access keyclock login detailes
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    padding: EdgeInsets.all(30.0),
                    itemCount: listSize,
                    itemBuilder: (context, int index) => BigCard(
                      index: index,
                      stateData:
                          Provider.of<DeviceGroupModel>(context).statesList,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
