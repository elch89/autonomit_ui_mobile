import 'package:flutter/material.dart';
import 'dart:core';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final fieldText = TextEditingController();
  String _ip = '';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("Illegal IPv4 address"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              fieldText.clear();
            },
            child: Text('OK')),
      ],
    );
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: screenWidth / 2,
                child: TextField(
                  controller: fieldText,
                  onChanged: (str) => {print(str), setState(() => _ip = str)},
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24.0, color: Color(0xFFFFFDFD)),
                  textAlign: TextAlign.start,
                  cursorColor: Color(0xFFFFFDFD),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFFDFD))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFFFDFD))),
                      hintText: 'Backend IP',
                      hintStyle: TextStyle(color: Color(0xFFFFFDFD))),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(0, 20, 0, 20))),
                      onPressed: () => {Navigator.pop(context)},
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(0, 20, 0, 20))),
                      onPressed: () {
                        try {
                          print(_ip);
                          Uri.parseIPv4Address(_ip);
                        } catch (error) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        }
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
