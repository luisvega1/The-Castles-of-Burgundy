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
  var _casilla00 = new Casilla();
  var _casilla01 = new Casilla();
  var _casilla02 = new Casilla();
  var _casilla03 = new Casilla();

  var _casilla10 = new Casilla();
  var _casilla11 = new Casilla();
  var _casilla12 = new Casilla();
  var _casilla13 = new Casilla();
  var _casilla14 = new Casilla();

  var _casilla20 = new Casilla();
  var _casilla21 = new Casilla();
  var _casilla22 = new Casilla();
  var _casilla23 = new Casilla();
  var _casilla24 = new Casilla();
  var _casilla25 = new Casilla();

  var _casilla30 = new Casilla();
  var _casilla31 = new Casilla();
  var _casilla32 = new Casilla();
  var _casilla33 = new Casilla();
  var _casilla34 = new Casilla();
  var _casilla35 = new Casilla();
  var _casilla36 = new Casilla();

  var _casilla40 = new Casilla();
  var _casilla41 = new Casilla();
  var _casilla42 = new Casilla();
  var _casilla43 = new Casilla();
  var _casilla44 = new Casilla();
  var _casilla45 = new Casilla();

  var _casilla50 = new Casilla();
  var _casilla51 = new Casilla();
  var _casilla52 = new Casilla();
  var _casilla53 = new Casilla();
  var _casilla54 = new Casilla();

  var _casilla60 = new Casilla();
  var _casilla61 = new Casilla();
  var _casilla62 = new Casilla();
  var _casilla63 = new Casilla();

  var _arrayTablero = [
    [Casilla(),Casilla(),Casilla(),Casilla()],
    [Casilla(),Casilla(),Casilla(),Casilla(),Casilla()],
    [Casilla(),Casilla(),Casilla(),Casilla(),Casilla(),Casilla()],
    [Casilla(),Casilla(),Casilla(),Casilla(),Casilla(),Casilla(),Casilla()],
    [Casilla(),Casilla(),Casilla(),Casilla(),Casilla(),Casilla()],
    [Casilla(),Casilla(),Casilla(),Casilla(),Casilla()],
    [Casilla(),Casilla(),Casilla(),Casilla()]
  ];
  var _auxArray;
  bool _init = false;


  loadSharedPrefs() async {
    // _auxArray = await sharedPref.read("array");
    // print(_auxArray);
    return await sharedPref.read("array");
  }

  saveSharedPrefs(){
    _casilla00.color = 'azul';
    _casilla00.numero = null;
    _casilla00.status = 'free';

    _casilla01.color = 'azul';
    _casilla01.numero = null;
    _casilla01.status = 'free';

    _casilla02.color = 'plata';
    _casilla02.numero = null;
    _casilla02.status = 'free';

    _casilla03.color = 'plata';
    _casilla03.numero = null;
    _casilla03.status = 'free';

    _casilla10.color = 'naranja';
    _casilla10.numero = null;
    _casilla10.status = 'free';

    _casilla11.color = 'naranja';
    _casilla11.numero = null;
    _casilla11.status = 'free';

    _casilla12.color = 'morado';
    _casilla12.numero = null;
    _casilla12.status = 'free';

    _casilla13.color = 'morado';
    _casilla13.numero = null;
    _casilla13.status = 'free';

    _casilla14.color = 'naranja';
    _casilla14.numero = null;
    _casilla14.status = 'free';

    _casilla20.color = 'naranja';
    _casilla20.numero = null;
    _casilla20.status = 'free';

    _casilla21.color = 'verde';
    _casilla21.numero = null;
    _casilla21.status = 'free';

    _casilla22.color = 'amarillo';
    _casilla22.numero = null;
    _casilla22.status = 'free';

    _casilla23.color = 'amarillo';
    _casilla23.numero = null;
    _casilla23.status = 'free';

    _casilla24.color = 'verde';
    _casilla24.numero = null;
    _casilla24.status = 'free';

    _casilla25.color = 'morado';
    _casilla25.numero = null;
    _casilla25.status = 'free';

    _casilla30.color = 'naranja';
    _casilla30.numero = null;
    _casilla30.status = 'free';

    _casilla31.color = 'azul';
    _casilla31.numero = null;
    _casilla31.status = 'free';

    _casilla32.color = 'azul';
    _casilla32.numero = null;
    _casilla32.status = 'free';

    _casilla33.color = 'morado';
    _casilla33.numero = null;
    _casilla33.status = 'free';

    _casilla34.color = 'naranja';
    _casilla34.numero = null;
    _casilla34.status = 'free';

    _casilla35.color = 'naranja';
    _casilla35.numero = null;
    _casilla35.status = 'free';

    _casilla36.color = 'naranja';
    _casilla36.numero = null;
    _casilla36.status = 'free';

    _casilla40.color = 'amarillo';
    _casilla40.numero = null;
    _casilla40.status = 'free';

    _casilla41.color = 'verde';
    _casilla41.numero = null;
    _casilla41.status = 'free';

    _casilla42.color = 'morado';
    _casilla42.numero = null;
    _casilla42.status = 'free';

    _casilla43.color = 'azul';
    _casilla43.numero = null;
    _casilla43.status = 'free';

    _casilla44.color = 'verde';
    _casilla44.numero = null;
    _casilla44.status = 'free';

    _casilla45.color = 'amarillo';
    _casilla45.numero = null;
    _casilla45.status = 'free';

    _casilla50.color = 'amarillo';
    _casilla50.numero = null;
    _casilla50.status = 'free';

    _casilla51.color = 'plata';
    _casilla51.numero = null;
    _casilla51.status = 'free';

    _casilla52.color = 'azul';
    _casilla52.numero = null;
    _casilla52.status = 'free';

    _casilla53.color = 'morado';
    _casilla53.numero = null;
    _casilla53.status = 'free';

    _casilla54.color = 'morado';
    _casilla54.numero = null;
    _casilla54.status = 'free';

    _casilla60.color = 'plata';
    _casilla60.numero = null;
    _casilla60.status = 'free';

    _casilla61.color = 'naranja';
    _casilla61.numero = null;
    _casilla61.status = 'free';

    _casilla62.color = 'amarillo';
    _casilla62.numero = null;
    _casilla62.status = 'free';

    _casilla63.color = 'amarillo';
    _casilla63.numero = null;
    _casilla63.status = 'free';

    _arrayTablero[0][0] = _casilla00;
    _arrayTablero[0][1] = _casilla01;
    _arrayTablero[0][2] = _casilla02;
    _arrayTablero[0][3] = _casilla03;
    _arrayTablero[1][0] = _casilla10;
    _arrayTablero[1][1] = _casilla11;
    _arrayTablero[1][2] = _casilla12;
    _arrayTablero[1][3] = _casilla13;
    _arrayTablero[1][4] = _casilla14;
    _arrayTablero[2][0] = _casilla20;
    _arrayTablero[2][1] = _casilla21;
    _arrayTablero[2][2] = _casilla22;
    _arrayTablero[2][3] = _casilla23;
    _arrayTablero[2][4] = _casilla24;
    _arrayTablero[2][5] = _casilla25;
    _arrayTablero[3][0] = _casilla30;
    _arrayTablero[3][1] = _casilla31;
    _arrayTablero[3][2] = _casilla32;
    _arrayTablero[3][3] = _casilla33;
    _arrayTablero[3][4] = _casilla34;
    _arrayTablero[3][5] = _casilla35;
    _arrayTablero[3][6] = _casilla36;
    _arrayTablero[4][0] = _casilla40;
    _arrayTablero[4][1] = _casilla41;
    _arrayTablero[4][2] = _casilla42;
    _arrayTablero[4][3] = _casilla43;
    _arrayTablero[4][4] = _casilla44;
    _arrayTablero[4][5] = _casilla45;
    _arrayTablero[5][0] = _casilla50;
    _arrayTablero[5][1] = _casilla51;
    _arrayTablero[5][2] = _casilla52;
    _arrayTablero[5][3] = _casilla53;
    _arrayTablero[5][4] = _casilla54;
    _arrayTablero[6][0] = _casilla60;
    _arrayTablero[6][1] = _casilla61;
    _arrayTablero[6][2] = _casilla62;
    _arrayTablero[6][3] = _casilla63;

    print(_arrayTablero);

    sharedPref.save("array", _arrayTablero);
  }

  deleteSavedPref() async{
    await sharedPref.remove("array");
  }

  void tap (int row, int pos, context) async {
    var array = await sharedPref.read("array") ;
    print(array);
  } 

}