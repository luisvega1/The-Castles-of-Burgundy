import 'package:castles_of_burgundy/game_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './constants/constants.dart';
import './constants/hexagon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Hexagono(
                color: kMerchHexagonColor,
                onTap: (){
                  GameBrain().saveSharedPrefs();
                },
              ),
            ),
            Container(
              child: Hexagono(
                color: kMerchHexagonColor,
                onTap: (){
                  GameBrain().loadSharedPrefs();
                },
              ),
            ),
            Container(
              child: Hexagono(
                color: kMineHexagonColor,
                onTap: (){
                  GameBrain().tap(0, 2, context);
                },
              ),
            ),
            Container(
              child: Hexagono(
                color: kMineHexagonColor,
                onTap: (){
                  GameBrain().tap(0, 3, context);
                },
              ),
            ),
          ],
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(1, 0, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(1, 1, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kChurchHexagonColor,
                    onTap: (){
                      GameBrain().tap(1, 2, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kChurchHexagonColor,
                    onTap: (){
                      GameBrain().tap(1, 3, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(1, 4, context);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(2, 0, context);
                    },
                  ),
                ),
                //Cambiar por el que tiene icono
                Container(
                  child: Hexagono(
                    color: kCastleHexagonColor,
                    onTap: (){
                      GameBrain().tap(2, 1, context);
                    },
                    castillo: 'castleB',
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kFieldHexagonColor,
                    onTap: (){
                      GameBrain().tap(2, 2, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kFieldHexagonColor,
                    onTap: (){
                      GameBrain().tap(2, 3, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kCastleHexagonColor,
                    onTap: (){
                      GameBrain().tap(2, 4, context);
                    },
                    castillo: 'castleG',
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kChurchHexagonColor,
                    onTap: (){
                      GameBrain().tap(2, 5, context);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(3, 0, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kMerchHexagonColor,
                    onTap: (){
                      GameBrain().tap(3, 1, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kMerchHexagonColor,
                    onTap: (){
                      GameBrain().tap(3, 2, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kChurchHexagonColor,
                    onTap: (){
                      GameBrain().tap(3, 3, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(3, 4, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(3, 5, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(3, 6, context);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Hexagono(
                    color: kFieldHexagonColor,
                    onTap: (){
                      GameBrain().tap(4, 0, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kCastleHexagonColor,
                    onTap: (){
                      GameBrain().tap(4, 1, context);
                    },
                    castillo: 'castleO',
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kChurchHexagonColor,
                    onTap: (){
                      GameBrain().tap(4, 2, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kMerchHexagonColor,
                    onTap: (){
                      GameBrain().tap(4, 3, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kCastleHexagonColor,
                    onTap: (){
                      GameBrain().tap(4, 4, context);
                    },
                    castillo: 'castleP',
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kFieldHexagonColor,
                    onTap: (){
                      GameBrain().tap(4, 5, context);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Hexagono(
                    color: kFieldHexagonColor,
                    onTap: (){
                      GameBrain().tap(5, 0, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kMineHexagonColor,
                    onTap: (){
                      GameBrain().tap(5, 1, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kMerchHexagonColor,
                    onTap: (){
                      GameBrain().tap(5, 2, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kChurchHexagonColor,
                    onTap: (){
                      GameBrain().tap(5, 3, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kChurchHexagonColor,
                    onTap: (){
                      GameBrain().tap(5, 4, context);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Hexagono(
                    color: kMineHexagonColor,
                    onTap: (){
                      GameBrain().tap(6, 0, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kTownHexagonColor,
                    onTap: (){
                      GameBrain().tap(6, 1, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kFieldHexagonColor,
                    onTap: (){
                      GameBrain().tap(6, 2, context);
                    },
                  ),
                ),
                Container(
                  child: Hexagono(
                    color: kFieldHexagonColor,
                    onTap: (){
                      GameBrain().tap(6, 3, context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
