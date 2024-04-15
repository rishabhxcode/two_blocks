import 'dart:math';

import 'package:flutter/material.dart';

class EnduranceQuestions {
  EnduranceQuestions(int level) : this._level = level;

  late int _level;
  late int timer;
  Random ran = Random();
  late int var1;
  late int var2;
  String def = '?';
  late String ansText = '';
  late int select;
  late String symbol;
  late var chosed;
  int score = 0;
  int count = 0;
  late String power;
  String root = '';
  late String v1;
  late String v2;
  late int answer;
  late Color ansColor;
  int timeleft = 0;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  makeText(int a) {
    if (ansText.length < 6) ansText += '$a';
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  choose_0(int chu) {
    timer = 10;
    ansColor = Colors.black;
    if (chu == 0) {
      //MULTIPLICATION
      var1 = 2 + ran.nextInt(19);
      var2 = 2 + ran.nextInt(9);
      answer = var1 * var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = 'X';
      v2 = '$var2';
    } else if (chu == 1) {
      //SQUARE
      var1 = 1 + ran.nextInt(10);
      var2 = 1 + ran.nextInt(10);
      answer = var1 * var1;
      root = '';
      v1 = '$var1';
      power = '\u00b2';
      symbol = '';
      v2 = '';
    } else if (chu == 2) {
      String x =
          ran.nextInt(10).toString() + ran.nextInt(5).toString(); //ADDITION
      var1 = int.parse(x);
      var2 = 1 + ran.nextInt(5);
      answer = var1 + var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '+';
      v2 = '$var2';
    } else if (chu == 3) {
      //SUBTRACTION
      var1 = 5 + ran.nextInt(5);
      var2 = 1 + ran.nextInt(5);
      answer = var1 - var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '-';
      v2 = '$var2';
    } else if (chu == 4) {
      //SQUARE ROOT
      var1 = 2 + ran.nextInt(14);
      var2 = 2 + ran.nextInt(14);
      answer = var1;
      root = '\u221a';
      v1 = '${var1 * var1}';
      power = '';
      symbol = '';
      v2 = '';
    } else if (chu == 5) {
      //PERCENT
      var1 = (1 + ran.nextInt(4)) * 10;
      var2 = (1 + ran.nextInt(25)) * 20;
      answer = ((var1 / 100) * var2).toInt();
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '%of ';
      v2 = '$var2';
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  choose_1(int chu) {
    timer = 12;
    ansColor = Colors.black;
    if (chu == 0) {
      //MULTIPLICATION
      var1 = 10 + ran.nextInt(90);
      var2 = 2 + ran.nextInt(9);
      answer = var1 * var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = 'X';
      v2 = '$var2';
    } else if (chu == 1) {
      //SQUARE
      var1 = 10 + ran.nextInt(10);
      var2 = 10 + ran.nextInt(10);
      answer = var1 * var1;
      root = '';
      v1 = '$var1';
      power = '\u00b2';
      symbol = '';
      v2 = '';
    } else if (chu == 2) {
      String x = (1 + ran.nextInt(5)).toString() +
          (5 + ran.nextInt(5)).toString(); //ADDITION
      var1 = int.parse(x);
      var2 = 1 + ran.nextInt(5);
      answer = var1 + var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '+';
      v2 = '$var2';
    } else if (chu == 3) {
      //SUBTRACTION
      var1 = 10 + ran.nextInt(89);
      var2 = 5 + ran.nextInt(5);
      answer = var1 - var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '-';
      v2 = '$var2';
    } else if (chu == 4) {
      //SQUARE ROOT
      var1 = 15 + ran.nextInt(15);
      var2 = 15 + ran.nextInt(15);
      answer = var1;
      root = '\u221a';
      v1 = '${var1 * var1}';
      power = '';
      symbol = '';
      v2 = '';
    } else if (chu == 5) {
      //PERCENT
      var1 = (1 + ran.nextInt(10)) * 5;
      var2 = (1 + ran.nextInt(35)) * 20;
      answer = ((var1 / 100) * var2).toInt();
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '%of ';
      v2 = '$var2';
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  choose_2(int chu) {
    timer = 15;
    ansColor = Colors.black;
    if (chu == 0) {
      //MULTIPLICATION
      var x = 1 + ran.nextInt(9) * 10;
      var1 = x + (ran.nextInt(10));
      var2 = x + (ran.nextInt(10));
      answer = var1 * var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = 'X';
      v2 = '$var2';
    } else if (chu == 1) {
      //SQUARE
      var1 = 20 + ran.nextInt(10);
      var2 = 20 + ran.nextInt(10);
      answer = var1 * var1;
      root = '';
      v1 = '$var1';
      power = '\u00b2';
      symbol = '';
      v2 = '';
    } else if (chu == 2) {
      //ADDITION
      var1 = 10 + ran.nextInt(40);
      var2 = 10 + ran.nextInt(40);
      answer = var1 + var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '+';
      v2 = '$var2';
    } else if (chu == 3) {
      //SUBTRACTION
      int x = 1 + ran.nextInt(9);
      var1 = int.parse(x.toString() + (5 + ran.nextInt(5)).toString());
      var2 = int.parse(
          (1 + ran.nextInt(x)).toString() + (1 + ran.nextInt(5)).toString());
      answer = var1 - var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '-';
      v2 = '$var2';
    } else if (chu == 4) {
      //SQUARE ROOT
      var1 = 30 + ran.nextInt(20);
      var2 = 2 + ran.nextInt(20);
      answer = var1;
      root = '\u221a';
      v1 = '${var1 * var1}';
      power = '';
      symbol = '';
      v2 = '';
    } else if (chu == 5) {
      //PERCENT
      var1 = (1 + ran.nextInt(19)) * 5;
      var2 = (1 + ran.nextInt(20)) * 50;
      answer = ((var1 / 100) * var2).toInt();
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '%of ';
      v2 = '$var2';
    }
    //CUBE ROOT
    else if (chu == 6) {
      var1 = 2 + ran.nextInt(9);
      var2 = 2 + ran.nextInt(9);
      answer = var1;
      root = '\u221b';
      v1 = '${pow(var1, 3)}';
      power = '';
      symbol = '';
      v2 = '';
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  choose_3(int chu) {
    timer = 20;
    ansColor = Colors.black;
    if (chu == 0) {
      //MULTIPLICATION
      int x = 1 + ran.nextInt(9) * 10;
      var1 = x + ran.nextInt(10);
      var2 = x - ran.nextInt(10);
      answer = var1 * var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = 'X';
      v2 = '$var2';
    } else if (chu == 1) {
      //SQUARE
      var1 = 30 + ran.nextInt(40);
      var2 = 1 + ran.nextInt(10);
      answer = var1 * var1;
      root = '';
      v1 = '$var1';
      power = '\u00b2';
      symbol = '';
      v2 = '';
    } else if (chu == 2) {
      //ADDITION
      var1 = 100 + ran.nextInt(400);
      var2 = 10 + ran.nextInt(90);
      answer = var1 + var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '+';
      v2 = '$var2';
    } else if (chu == 3) {
      //SUBTRACTIOM
      var1 = 100 + ran.nextInt(400);
      var2 = 10 + ran.nextInt(90);
      answer = var1 - var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '-';
      v2 = '$var2';
    } else if (chu == 4) {
      //SQUARE ROOT
      var1 = 50 + ran.nextInt(50);
      var2 = 2 + ran.nextInt(19);
      answer = var1;
      root = '\u221a';
      v1 = '${var1 * var1}';
      power = '';
      symbol = '';
      v2 = '';
    } else if (chu == 5) {
      //PERCENT
      var1 = (1 + ran.nextInt(4)) * 2;
      var2 = (1 + ran.nextInt(50)) * 50;
      answer = ((var1 / 100) * var2).toInt();
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '%of ';
      v2 = '$var2';
    }
    //CUBE ROOT
    else if (chu == 6) {
      var1 = 2 + ran.nextInt(19);
      var2 = 2 + ran.nextInt(9);
      answer = var1;
      root = '\u221b';
      v1 = '${pow(var1, 3)}';
      power = '';
      symbol = '';
      v2 = '';
    }
    //CUBE
    else if (chu == 7) {
      var1 = 2 + ran.nextInt(9);
      var2 = 2 + ran.nextInt(9);
      answer = pow(var1, 3).toInt();
      root = '';
      v1 = '$var1';
      power = '\u00b3';
      symbol = '';
      v2 = '';
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  choose_4(int chu) {
    timer = 30;
    ansColor = Colors.black;
    if (chu == 0) {
      //MULTIPLICATION
      var1 = 100 + ran.nextInt(900);
      var2 = 2 + ran.nextInt(9);
      answer = var1 * var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = 'X';
      v2 = '$var2';
    } else if (chu == 1) {
      //SQUARE
      var1 = 70 + ran.nextInt(55);
      var2 = 1 + ran.nextInt(10);
      answer = var1 * var1;
      root = '';
      v1 = '$var1';
      power = '\u00b2';
      symbol = '';
      v2 = '';
    } else if (chu == 2) {
      //ADDITION
      var1 = 100 + ran.nextInt(400);
      var2 = 100 + ran.nextInt(400);
      answer = var1 + var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '+';
      v2 = '$var2';
    } else if (chu == 3) {
      //SUBTRACTION
      int x = 1 + ran.nextInt(9) * 100;
      var1 = x + ran.nextInt(100);
      var2 = ran.nextInt(var1);
      answer = var1 - var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '-';
      v2 = '$var2';
    } else if (chu == 4) {
      //SQUARE ROOT
      var1 = 100 + ran.nextInt(100);
      var2 = 2 + ran.nextInt(19);
      answer = var1;
      root = '\u221a';
      v1 = '${var1 * var1}';
      power = '';
      symbol = '';
      v2 = '';
    }
    //PERCENT
    else if (chu == 5) {
      var1 = (1 + ran.nextInt(25)) * 5;
      var2 = (1 + ran.nextInt(50)) * 20;
      answer = ((var1 / 100) * var2).toInt();
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '%of ';
      v2 = '$var2';
    }
    //CUBE ROOT
    else if (chu == 6) {
      var1 = 10 + ran.nextInt(10);
      var2 = 2 + ran.nextInt(9);
      answer = var1;
      root = '\u221b';
      v1 = '${pow(var1, 3)}';
      power = '';
      symbol = '';
      v2 = '';
    }
    //CUBE
    else if (chu == 7) {
      var1 = 5 + ran.nextInt(5);
      var2 = 2 + ran.nextInt(9);
      answer = pow(var1, 3).toInt();
      root = '';
      v1 = '$var1';
      power = '\u00b3';
      symbol = '';
      v2 = '';
    }
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  choose_5(int chu) {
    timer = 45;
    ansColor = Colors.black;
    if (chu == 0) {
      //MULTIPLICATION
      var1 = 10 + ran.nextInt(90);
      var2 = 10 + ran.nextInt(90);
      answer = var1 * var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = 'X';
      v2 = '$var2';
    } else if (chu == 1) {
      //SQUARE
      var1 = 1 + ran.nextInt(10);
      var2 = 1 + ran.nextInt(10);
      answer = var1 * var1;
      root = '';
      v1 = '$var1';
      power = '\u00b2';
      symbol = '';
      v2 = '';
    } else if (chu == 2) {
      //ADDITION
      var1 = 100 + ran.nextInt(2400);
      var2 = 100 + ran.nextInt(2400);
      answer = var1 + var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '+';
      v2 = '$var2';
    } else if (chu == 3) {
      //SUBTRACTIOM
      var1 = 1000 + ran.nextInt(9000);
      var2 = ran.nextInt(var1);
      answer = var1 - var2;
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '-';
      v2 = '$var2';
    } else if (chu == 4) {
      //SQUARE ROOT
      var1 = 200 + ran.nextInt(800);
      var2 = 2 + ran.nextInt(19);
      answer = var1;
      root = '\u221a';
      v1 = '${var1 * var1}';
      power = '';
      symbol = '';
      v2 = '';
    }
    //PERCENT
    else if (chu == 5) {
      int x = ran.nextInt(2);
      if (x == 0) {
        var1 = (1 + ran.nextInt(400)) * 2;
        var2 = (100 + ran.nextInt(150)) * 50;
      } else if (x == 1) {
        var1 = (1 + ran.nextInt(120)) * 5;
        var2 = (100 + ran.nextInt(1900)) * 20;
      }
      answer = ((var1 / 100) * var2).toInt();
      root = '';
      v1 = '$var1';
      power = '';
      symbol = '%of ';
      v2 = '$var2';
    }
    //CUBE ROOT
    else if (chu == 6) {
      var1 = 50 + ran.nextInt(50);
      var2 = 2 + ran.nextInt(9);
      answer = var1;
      root = '\u221b';
      v1 = '${pow(var1, 3)}';
      power = '';
      symbol = '';
      v2 = '';
    }
    //CUBE
    else if (chu == 7) {
      var1 = 10 + ran.nextInt(10);
      var2 = 2 + ran.nextInt(9);
      answer = pow(var1, 3).toInt();
      root = '';
      v1 = '$var1';
      power = '\u00b3';
      symbol = '';
      v2 = '';
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  result(int chu, Function reset) async {
    if (select == 0) {
      //MULTIPLICATION......................................................................................
      if (int.parse(ansText) == var1 * var2) {
        ansColor = Colors.green.shade700;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    } else if (select == 1) {
      //SQUARE....................................................................................................
      if (int.parse(ansText) == var1 * var1) {
        ansColor = Colors.green;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    } else if (select == 2) {
      //ADDITION........................................................................................................
      if (int.parse(ansText) == var1 + var2) {
        ansColor = Colors.green;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    } else if (select == 3) {
      //SUBTRACTION...........................................................................................
      if (int.parse(ansText) == var1 - var2) {
        ansColor = Colors.green;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    } else if (select == 4) {
      //SQUARE ROOT.............................................................................................
      if (int.parse(ansText) == var1) {
        ansColor = Colors.green;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    } else if (select == 5) {
      //PERCENT.........................................................................................
      if (int.parse(ansText) == ((var1 / 100) * var2).toInt()) {
        ansColor = Colors.green;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    }
    //CUBE ROOT...................................................................................................
    else if (select == 6) {
      if (int.parse(ansText) == var1) {
        ansColor = Colors.green;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    }
    // CUBE...........................................................................................
    else if (select == 7) {
      if (int.parse(ansText) == pow(var1, 3)) {
        ansColor = Colors.green;

        await Future.delayed(Duration(milliseconds: 500), () {
          ansText = '';
          choose();
          count++;
          score += timeleft;
          reset();
        });
      }
    }
  }

  choose() {
    if (_level == 0) {
      select = ran.nextInt(6);
      choose_0(select);
    } else if (_level == 1) {
      select = ran.nextInt(6);
      choose_1(select);
    } else if (_level == 2) {
      select = ran.nextInt(7);
      choose_2(select);
    } else if (_level == 3) {
      select = ran.nextInt(8);
      choose_3(select);
    } else if (_level == 4) {
      select = ran.nextInt(8);
      choose_4(select);
    } else if (_level == 5) {
      select = ran.nextInt(8);
      choose_5(select);
    }
  }
}
