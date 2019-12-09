import 'dart:convert';
import 'dart:math';

import 'package:castles_of_burgundy/game_brain.dart';
import 'package:castles_of_burgundy/screens/boardScreen.dart';
import 'package:castles_of_burgundy/screens/menu.dart';
import 'sharedPref.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shape_of_view/shape_of_view.dart';
import './constants/constants.dart';
import './constants/hexagon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Menu(),
    );
  }
}
