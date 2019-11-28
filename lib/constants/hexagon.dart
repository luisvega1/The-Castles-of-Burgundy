import 'package:castles_of_burgundy/game_brain.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'constants.dart';

int colour;

class Hexagono extends StatefulWidget {
  Hexagono({this.onTap, @required this.color, this.puntos, this.castillo});
      Color color;
      String puntos;
      String castillo;  
      Function onTap;

      @override
      _HexagonoState createState() => _HexagonoState();
}

class _HexagonoState extends State<Hexagono> {
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
      onTap: widget.onTap,
      child: Transform.rotate(
        angle: .53,
        child: ShapeOfView(
          shape: PolygonShape(numberOfSides: 6),
          width: 55.0,
          height: 55.0,
          child: Transform.rotate(
            angle: -.53,
            child: Container(
              color: widget.color,
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
    );
  }
}
