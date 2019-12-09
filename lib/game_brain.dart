import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sharedPref.dart';

class Casilla{
  String color;
  String status;
  int numero;
}

class GameBrain{
  SharedPref sharedPref = SharedPref();

  var _arrayTablero = [
    [{'color': 'azul',
      'status': null,
      'num': null
    },
    {
      'color': 'azul',
      'status': null,
      'num': null
    },
    {
      'color': 'gris',
      'status': null,
      'num': null
    },
    {
      'color': 'gris',
      'status': null,
      'num': null
    }],
    [{ 'color': 'naranja',
      'status': null,
      'num': null
    },
    {
      'color': 'naranja',
      'status': null,
      'num': null
    },
    {
      'color': 'morado',
      'status': null,
      'num': null
    },
    {
      'color': 'morado',
      'status': null,
      'num': null
    },
    {
      'color': 'naranja',
      'status': null,
      'num': null
    }],
    [{'color': 'naranja',
      'status': null,
      'num': null
    },
    {
      'color': 'verde',
      'status': null,
      'num': null
    },
    {
      'color': 'amarillo',
      'status': null,
      'num': null
    },
    {
      'color': 'amarillo',
      'status': null,
      'num': null
    },
    {
      'color': 'verde',
      'status': null,
      'num': null
    },
    {
      'color': 'morado',
      'status': null,
      'num': null
    }],
    [{'color': 'naranja',
      'status': null,
      'num': null
    },
    {
      'color': 'azul',
      'status': null,
      'num': null
    },
    {
      'color': 'azul',
      'status': null,
      'num': null
    },
    {
      'color': 'morado',
      'status': null,
      'num': null
    },
    {
      'color': 'naranja',
      'status': null,
      'num': null
    },
    {
      'color': 'naranja',
      'status': null,
      'num': null
    },
    {
      'color': 'naranja',
      'status': null,
      'num': null
    }],
    [{'color': 'amarillo',
      'status': null,
      'num': null
    },
    {
      'color': 'verde',
      'status': null,
      'num': null
    },
    {
      'color': 'morado',
      'status': null,
      'num': null
    },
    {
      'color': 'azul',
      'status': null,
      'num': null
    },
    {
      'color': 'verde',
      'status': null,
      'num': null
    },
    {
      'color': 'amarillo',
      'status': null,
      'num': null
    }],
    [{'color': 'amarillo',
      'status': null,
      'num': null
    },
    {
      'color': 'gris',
      'status': null,
      'num': null
    },
    {
      'color': 'azul',
      'status': null,
      'num': null
    },
    {
      'color': 'morado',
      'status': null,
      'num': null
    },
    {
      'color': 'morado',
      'status': null,
      'num': null
    }],
    [{'color': 'gris',
      'status': null,
      'num': null
    },
    {
      'color': 'naranja',
      'status': null,
      'num': null
    },
    {
      'color': 'amarillo',
      'status': null,
      'num': null
    },
    {
      'color': 'amarillo',
      'status': null,
      'num': null
    }]
  ];
  var _auxArray;
  bool _init;
  var _dado1;
  var _dado2;

  var _color1;
  var _color2;

  //METODO PARA COMENZAR EL JUESGO
  Future<String> initGame() async{
    sharedPref.save("board", _arrayTablero);
    sharedPref.save("turn", false);
    return json.encode(_arrayTablero);
  }

  void getDados(int dado1, int dado2, String color1, String color2 ){
    _dado1 = dado1;
    _dado2 = dado2;

    _color1 = color1;
    _color2 = color2;

    checkTable();
  }

  void checkTable() async{
    _auxArray = await setTale();

    for(int i = 0; i < _auxArray.length; i++){
      for(int j = 0; j < _auxArray[i].length; j++){
        print(_auxArray[i][j]);
      }
    }

  }

  //REINICIAR JUEGO
  void restartGame(){
    sharedPref.remove("board");
    sharedPref.remove("gameStatus");
    sharedPref.save("gameStatus", false);
    print("==Reiniciamos juego==");
  }

  setTale() async{
    final prefs = await SharedPreferences.getInstance();
    _auxArray = json.decode(prefs.getString("board"));
    return _auxArray;
  }

  getInit() async{
    var init = await sharedPref.read("gameStatus");
    return init;
  }


  

  Future<String> tap (int row, int pos, context) async { 
    final prefs = await SharedPreferences.getInstance();
    _auxArray = json.decode(prefs.getString("board"));
    var init = await sharedPref.read("gameStatus");
    var turn = await sharedPref.read("turn");
    if(init == false && ((row == 2 && pos == 1) || row == 2 && pos == 4 || row == 4 && pos == 1 || row ==4 && pos == 4)){
      _auxArray[row][pos]['status'] = 'ocupado';
      sharedPref.save("board",_auxArray);
      sharedPref.remove("gameStatus");
      sharedPref.save("gameStatus", true);
      sharedPref.save("turn", true);
      return json.encode(_auxArray);
    }else{
      var init = await sharedPref.read("gameStatus");
      if(init && !turn){
        print("DESDE AQUI ${_auxArray}");
        return json.encode(_auxArray);
      }
    }
  } 

}