import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sharedPref.dart';

class GameBrain{
  SharedPref sharedPref = SharedPref();
  var _arrayTablero = [
    // ROW 0
    [{
      'color': 'azul',
      'status': 'libre',
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
    // ROW 1
    [{
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
    // ROW 2
    [{
      'color': 'naranja',
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
    // ROW 3
    [{
      'color': 'naranja',
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
    // ROW 4
    [{
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
    // ROW 5
    [{
      'color': 'amarillo',
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
    // ROW 6
    [{
      'color': 'gris',
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
  bool _init = false;

  loadSharedPrefs() async {
    _auxArray = await sharedPref.read("array");
    print(_auxArray);
  }

  saveSharedPrefs(){
    sharedPref.save("array", _arrayTablero);
  }

  void tap (int row, int pos, context){
    print('FILA ${row} CASILLA ${pos}');
  }

}