import 'dart:math';

import 'package:two_blocks/constants.dart';
/*
 * 0 = add
 * 1 = subtract
 * 2 = multiply
 * 3 = divide
 */

class OneBlockQuestions {
  Random random = Random();
  var1Generator() {
    return random.nextInt(10);
  }

  var2Generator() {
    return random.nextInt(10);
  }

  choiceGenerator(){
    return random.nextInt(4);
  }
  String operationGenerator(){
    int operateVar = random.nextInt(2);
    if(operateVar==0)
    return Constants.add;
    else
    return Constants.minus;
    
  }
}
