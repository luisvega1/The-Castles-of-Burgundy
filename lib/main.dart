import 'dart:convert';
import 'dart:math';

import 'package:castles_of_burgundy/game_brain.dart';
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

  int _dado1 = 6;
  int _dado2 = 4;
  String _color1;
  String _color2;

  var _colores = ['naranja','morado','gris','verde','amarillo','azul'];
  var _array;
  var _turn = false;
  // var _array = SharedPref().read("board");

  void changeDiceFace() async {
    var status = await SharedPref().read("gameStatus");
    var turn = await SharedPref().read("turn");
    print("el turno ${turn}");
    if(status == true && turn == true){
      setState(() {
      _dado1 = Random().nextInt(6)+1;
      _dado2 = Random().nextInt(6)+1;

      _color1 = _colores[Random().nextInt(6)];
      _color2 = _colores[Random().nextInt(6)];

      SharedPref().save("turn", false);

      GameBrain().getDados(_dado1, _dado2, _color1, _color2);
    });
    }
  }


  void setArray(data){
    print(data);
    setState(() {
      _array = data;
    });
  }

  void getBoard() async {
    var board = await SharedPref().read("board");
    print(board);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/castles_of_burgundy.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Row(
            children: <Widget>[  
              Flexible(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/castles_of_burgundy.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Hexagono(
                      color: kMerchHexagonColor,
                      hexColor: _array[0][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                      onTap: (){
                        GameBrain test = GameBrain();
                        test.tap(0, 0, context).then((String s) => (_array = json.decode(s)));
                        print(_array[0][0]);
                      },
                    ),
                  ),
                  Container(
                    child: Hexagono(
                      color: kMerchHexagonColor,
                      hexColor: _array[0][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                      onTap: (){
                        GameBrain test = GameBrain();
                        test.tap(0, 1, context).then((String s) => (_array = json.decode(s)) );
                      },
                    ),
                  ),
                  Container(
                    child: Hexagono(
                      color: kMineHexagonColor,
                      hexColor: _array[0][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                      onTap: (){
                        GameBrain test = GameBrain();
                        test.tap(0, 2, context).then((String s) => (_array = json.decode(s)) );
                      },
                    ),
                  ),
                  Container(
                    child: Hexagono(
                      color: kMineHexagonColor,
                      hexColor: _array[0][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                      onTap: (){
                        GameBrain test = GameBrain();
                        test.tap(0, 3, context).then((String s) => (_array = json.decode(s)) );
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
                          hexColor: _array[1][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          hexColor: _array[1][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          hexColor: _array[1][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          hexColor: _array[1][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          hexColor: _array[1][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 4, context).then((String s) => (_array = json.decode(s)) );
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
                          hexColor: _array[2][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(2, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      //Cambiar por el que tiene icono
                      Container(
                        child: Hexagono(
                          color: kCastleHexagonColor,
                          hexColor: _array[2][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            print("verga");
                            GameBrain test = GameBrain();
                            test.tap(2, 1, context).then((String s) => this.setArray(json.decode(s)) );
                          },
                          castillo: 'castleB',
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          hexColor: _array[2][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(2, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          hexColor: _array[2][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(2, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kCastleHexagonColor,
                          hexColor: _array[2][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(2, 4, context).then((String s) => (_array = json.decode(s)) );
                          },
                          castillo: 'castleG',
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          hexColor: _array[2][5]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][5]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(2, 5, context).then((String s) => (_array = json.decode(s)) );
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
                          hexColor: _array[3][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          hexColor: _array[3][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          hexColor: _array[3][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          hexColor: _array[3][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          hexColor: _array[3][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 4, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          hexColor: _array[3][5]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][5]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 5, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          hexColor: _array[3][6]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][6]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 6, context).then((String s) => (_array = json.decode(s)) );
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
                          hexColor: _array[4][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kCastleHexagonColor,
                          hexColor: _array[4][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                          castillo: 'castleO',
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          hexColor: _array[4][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          hexColor: _array[4][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kCastleHexagonColor,
                          hexColor: _array[4][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 4, context).then((String s) => (_array = json.decode(s)) );
                          },
                          castillo: 'castleP',
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          hexColor: _array[4][5]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][5]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 5, context).then((String s) => (_array = json.decode(s)) );
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
                          hexColor: _array[5][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMineHexagonColor,
                          hexColor: _array[5][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          hexColor: _array[5][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          hexColor: _array[5][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          hexColor: _array[5][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 4, context).then((String s) => (_array = json.decode(s)) );
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
                          hexColor: _array[6][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(6, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          hexColor: _array[6][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(6, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          hexColor: _array[6][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(6, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          hexColor: _array[6][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(6, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                    ],
                  )
                ],
                ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              color: Color(0xFF862323),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.diceFour,
                                  size: 22.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  'Lanzar dados',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {
                              changeDiceFace();
                            },
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              _dado1 == 1 ? FontAwesomeIcons.diceOne : _dado1 == 2 ? FontAwesomeIcons.diceTwo : _dado1 == 3 ? FontAwesomeIcons.diceThree : _dado1 == 4 ? FontAwesomeIcons.diceFour : _dado1 == 5 ? FontAwesomeIcons.diceFive :  FontAwesomeIcons.diceSix,
                              size: 35.0,
                              color: Color(0xFF862323),
                            ),
                            Icon(
                              _dado1 == 2 ? FontAwesomeIcons.diceOne : _dado2 == 2 ? FontAwesomeIcons.diceTwo : _dado2 == 3 ? FontAwesomeIcons.diceThree : _dado2 == 4 ? FontAwesomeIcons.diceFour : _dado2 == 5 ? FontAwesomeIcons.diceFive :  FontAwesomeIcons.diceSix,
                              size: 35.0,
                              color: Color(0xFF862323),
                            ),
                            Container(
                              child: Transform.rotate(
                              angle: .78,
                              child: ShapeOfView(
                                shape: PolygonShape(numberOfSides: 4),
                                width: 45.0,
                                height: 45.0,
                                child: Transform.rotate(
                                  angle: -.53,
                                  child: Container(
                                    color: _color1 == 'narnja' ? kTownHexagonColor : _color1 == 'azul' ? kMerchHexagonColor : _color1 == 'morado' ? kChurchHexagonColor : _color1 == 'amarillo' ? kFieldHexagonColor : _color1 == 'gris' ? kMineHexagonColor : kCastleHexagonColor,
                                    width: 20.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            ),
                            Container(
                              child: Transform.rotate(
                              angle: .78,
                              child: ShapeOfView(
                                shape: PolygonShape(numberOfSides: 4),
                                width: 45.0,
                                height: 45.0,
                                child: Transform.rotate(
                                  angle: -.53,
                                  child: Container(
                                    color: _color2 == 'narnja' ? kTownHexagonColor : _color2 == 'azul' ? kMerchHexagonColor : _color2 == 'morado' ? kChurchHexagonColor : _color2 == 'amarillo' ? kFieldHexagonColor : _color2 == 'gris' ? kMineHexagonColor : kCastleHexagonColor,
                                    width: 20.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            ),
                          
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.hourglass,
                                size: 20.0,
                                color: Color(0xFF862323)
                            ),
                            Text(
                              'Era : 1',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Text(
                              'Turno : 1',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Score: 1',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.gavel,
                              size: 20.0,
                              color: Color(0xFF862323),
                            ),
                            Text(
                              'Trabajadores: 0',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.church,
                              size: 20.0,
                              color: Color(0xFF862323),
                            ),
                            Text(
                              'Monjes: 0',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.coins,
                              size: 20.0,
                              color: Color(0xFF862323),
                            ),
                            Text(
                              'Plata: 0',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.box,
                              size: 20.0,
                              color: Color(0xFF862323),
                            ),
                            Text(
                              'Mercancía: 0',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  RaisedButton(
                                    color: Color(0xFF862323),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          'Iniciar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      GameBrain test = GameBrain();
                                      test.initGame().then((String s) => this.setArray(json.decode(s)));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 5,
                              child: Column(
                                children: <Widget>[
                                  RaisedButton(
                                    color: Color(0xFF862323),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          'Reiniciar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      GameBrain().restartGame();
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
