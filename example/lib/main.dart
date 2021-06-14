import 'package:flutter/material.dart';
import 'package:flutter_hms_gms_checker/flutter_hms_gms_checker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool gms, hms;

  @override
  void initState() {
    super.initState();
    FlutterHmsGmsChecker.isGmsAvailable.then((t) {
      setState(() {
        gms = t;
      });
    });
    FlutterHmsGmsChecker.isHmsAvailable.then((t) {
      setState(() {
        hms = t;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HMS/GMS Availability'),
        ),
        body: Center(
          child: Text('GMS Available:  $gms\nHMS Available:  $hms'),
        ),
      ),
    );
  }
}
