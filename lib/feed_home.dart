import 'package:flutter/material.dart';
import 'package:feed/feed_body.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class FeedHomePage extends StatefulWidget {
  @override
  _FeedHomePageState createState() => _FeedHomePageState();
}

class _FeedHomePageState extends State<FeedHomePage> {
  static const platform = const MethodChannel('lost.in.tv/battery');

  String _batteryLevel = '100 %';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = '$result %';
    } on PlatformException {
      batteryLevel = 'error';
    }
    // update battery level
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // top bar
    final topBar = AppBar(
      // camera icon
      leading: Container(
        margin: const EdgeInsets.only(left: 12.0),
        child: const Icon(Icons.camera_alt),
      ),
      // title
      title: const Text(
        'Helo',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      // battery information
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.battery_unknown),
                onPressed: _getBatteryLevel,
              ),
              SizedBox(width: 5),
              Text(
                _batteryLevel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );

    // size of each icon in the bottom size
    const iconSize = 30.0;

    // bottom bar
    final bottomBar = BottomAppBar(
      child: Container(
        height: 35, // for iPhone XR
        // height: 55, // for iPhone SE
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            // home icon
            Icon(
              Icons.home,
              size: iconSize,
            ),
            // search icon
            Icon(
              Icons.search,
              color: Colors.grey,
              size: iconSize,
            ),
            // add box icon
            Icon(
              Icons.add_box,
              color: Colors.grey,
              size: iconSize,
            ),
            // favorite icon
            Icon(
              Icons.favorite,
              color: Colors.grey,
              size: iconSize,
            ),
            // account box icon
            Icon(
              Icons.account_box,
              color: Colors.grey,
              size: iconSize,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: topBar,
      body: FeedBody(),
      bottomNavigationBar: bottomBar,
    );
  }
}
