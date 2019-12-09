import 'dart:convert';
import 'dart:math';
import 'package:castles_of_burgundy/constants/constants.dart';
import 'package:castles_of_burgundy/constants/hexagon.dart';
import 'package:castles_of_burgundy/game_brain.dart';
import 'package:castles_of_burgundy/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shape_of_view/shape_of_view.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreen createState() => _BoardScreen();
}

class _BoardScreen extends State<BoardScreen> {

  int _dado1 = 6;
  int _dado2 = 4;

  int _trabajadores;
  int _mercancia;
  int _plata;
  int _monjes;

  String _color1;
  String _color2;

  var _colores = ['naranja','morado','gris','verde','amarillo','azul'];

  GameBrain test = GameBrain();
  var _array;
  var _turn = false;
  // var _array = SharedPref().read("board");

  void changeDiceFace() async {
    var status = await SharedPref().read("gameStatus");
    var turn = await SharedPref().read("turn");
    if(status == true && turn == true){
      setState(() {
      _dado1 = Random().nextInt(6)+1;
      _dado2 = Random().nextInt(6)+1;

      _color1 = _colores[Random().nextInt(6)];
      _color2 = _colores[Random().nextInt(6)];

      SharedPref().save("turn", false);
      print("Desde aca colores: ${_color1} ${_color2}");
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
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            children: <Widget>[  
              Flexible(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/fondo.jpg"),
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
                      image: 'azul.png',
                      hexColor: _array != null ? _array[0][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                      image: 'azul.png',
                      hexColor: _array != null ? _array[0][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                      onTap: (){
                        GameBrain test = GameBrain();
                        test.tap(0, 1, context).then((String s) => (_array = json.decode(s)) );
                      },
                    ),
                  ),
                  Container(
                    child: Hexagono(
                      color: kMineHexagonColor,
                      image: 'gris.png',
                      hexColor: _array != null ? _array[0][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                      onTap: (){
                        GameBrain test = GameBrain();
                        test.tap(0, 2, context).then((String s) => (_array = json.decode(s)) );
                      },
                    ),
                  ),
                  Container(
                    child: Hexagono(
                      color: kMineHexagonColor,
                      image: 'gris.png',
                      hexColor: _array != null ? _array[0][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[0][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[1][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[1][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          image: 'morado.jpg',
                          hexColor: _array != null ? _array[1][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          image: 'morado.jpg',
                          hexColor: _array != null ? _array[1][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(1, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[1][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[1][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[2][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'verde.png',
                          hexColor: _array != null ? _array[2][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'amarillo.png',
                          hexColor: _array != null ? _array[2][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(2, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          image: 'amarillo.png',
                          hexColor: _array != null ? _array[2][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(2, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kCastleHexagonColor,
                          image: 'verde.png',
                          hexColor: _array != null ? _array[2][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'morado.jpg',
                          hexColor: _array != null ? _array[2][5]['status'] == 'ocupado' ? kBusyHexagonColor : _array[2][5]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[3][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          image: 'azul.png',
                          hexColor: _array != null ? _array[3][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          image: 'azul.png',
                          hexColor: _array != null ? _array[3][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          image: 'morado.jpg',
                          hexColor: _array != null ? _array[3][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[3][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 4, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[3][5]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][5]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(3, 5, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[3][6]['status'] == 'ocupado' ? kBusyHexagonColor : _array[3][6]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'amarillo.png',
                          hexColor: _array != null ? _array[4][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kCastleHexagonColor,
                          image: 'verde.png',
                          hexColor: _array != null ? _array[4][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'morado.jpg',
                          hexColor: _array != null ? _array[4][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          image: 'azul.png',
                          hexColor: _array != null ? _array[4][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(4, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kCastleHexagonColor,
                          image: 'verde.png',
                          hexColor: _array != null ? _array[4][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'amarillo.png',
                          hexColor: _array != null ? _array[4][5]['status'] == 'ocupado' ? kBusyHexagonColor : _array[4][5]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'amarillo.png',
                          hexColor: _array != null ? _array[5][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMineHexagonColor,
                          image: 'gris.png',
                          hexColor: _array != null ? _array[5][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kMerchHexagonColor,
                          image: 'azul.png',
                          hexColor: _array != null ? _array[5][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          image: 'morado.jpg',
                          hexColor: _array != null ? _array[5][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(5, 3, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kChurchHexagonColor,
                          image: 'morado.jpg',
                          hexColor: _array != null ? _array[5][4]['status'] == 'ocupado' ? kBusyHexagonColor : _array[5][4]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                          image: 'gris.png',
                          hexColor: _array != null ? _array[6][0]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][0]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(6, 0, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kTownHexagonColor,
                          image: 'naranja.png',
                          hexColor: _array != null ? _array[6][1]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][1]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(6, 1, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          image: 'amarillo.png',
                          hexColor: _array != null ? _array[6][2]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][2]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
                          onTap: (){
                            GameBrain test = GameBrain();
                            test.tap(6, 2, context).then((String s) => (_array = json.decode(s)) );
                          },
                        ),
                      ),
                      Container(
                        child: Hexagono(
                          color: kFieldHexagonColor,
                          image: 'amarillo.png',
                          hexColor: _array != null ? _array[6][3]['status'] == 'ocupado' ? kBusyHexagonColor : _array[6][3]['status'] == 'libre' ? kFreeHexagonColor : kNullHexagonColor : kNullHexagonColor,
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
                  padding: EdgeInsets.all(5),
                  color: Colors.white70,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/logo.png',
                              width: 150,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              color: Color(0xFFfbffc9),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.diceFour,
                                  size: 22.0,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  'Lanzar dados',
                                  style: TextStyle(
                                    color: Colors.black45,
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
                                    color: _color1 == 'naranja' ? kTownHexagonColor : _color1 == 'azul' ? kMerchHexagonColor : _color1 == 'morado' ? kChurchHexagonColor : _color1 == 'amarillo' ? kFieldHexagonColor : _color1 == 'gris' ? kMineHexagonColor : kCastleHexagonColor,
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
                                    color: _color2 == 'naranja' ? kTownHexagonColor : _color2 == 'azul' ? kMerchHexagonColor : _color2 == 'morado' ? kChurchHexagonColor : _color2 == 'amarillo' ? kFieldHexagonColor : _color2 == 'gris' ? kMineHexagonColor : kCastleHexagonColor,
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
                            Image.asset(
                              'assets/sand-clock.jpg',
                              width: 18,
                            ),
                            Text(
                              'Era : 1',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)
                              )
                            ),
                            Text(
                              ' - ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)
                              )
                            ),
                            Text(
                              'Turno : 1',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)
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
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)
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
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/worker_icon.png',
                                    width: 30,
                                  ),
                                  Text(
                                    '${_trabajadores != null ? _trabajadores : 0}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF000000)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/silver_icon.png',
                                  width: 30,
                                ),
                                Text(
                                  '${_trabajadores != null ? _trabajadores : 0}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF000000)
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/monje_icon.png',
                                  width: 30,
                                ),
                                Text(
                                  '${_trabajadores != null ? _trabajadores : 0}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF000000)
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/merch_icon.jpg',
                                  width: 30,
                                ),
                                Text(
                                  '${_trabajadores != null ? _trabajadores : 0}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF000000)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              color: Color(0xFFff4f4f),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  'Salir',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            )
                          ],
                        ),
                      )
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
