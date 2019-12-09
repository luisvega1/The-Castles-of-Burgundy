import 'package:castles_of_burgundy/game_brain.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'constants.dart';

int colour;
var _data=1;

class Hexagono extends StatelessWidget {
  Hexagono({this.onTap, this.hexColor, this.state,  @required this.color, this.puntos, this.castillo});
  Color color;
  String puntos;
  String castillo;  
  Function onTap;
  String state;
  Color hexColor;

  Color selectColor(String castillo) {
    Color color;
    switch (castillo) {
      case 'castleB':
        color = kMerchHexagonColor;
        break;
      case 'castleY':
        color = kFieldHexagonColor;
        break;
      case 'castleO':
        color = kTownHexagonColor;
        break;
      case 'castleP':
        color = kChurchHexagonColor;
        break;
      case 'castleG':
        color = kMineHexagonColor;
        break;
      default:
        color = Colors.white;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: hexColor 
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(40)
          ),
        ),
        child: Transform.rotate(
          angle: .53,
          child: ShapeOfView(
            shape: PolygonShape(
              numberOfSides: 6,   
            ),
            width: 55.0,
            height: 55.0,
            child: Transform.rotate(
              angle: -.53,
              child: Container(
                color: color,
                width: 20.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
