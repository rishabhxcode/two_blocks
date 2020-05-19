import 'dart:math';

import 'package:two_blocks/constants.dart';
/*
 * 0 = add
 * 1 = subtract
 * 2 = multiply
 * 3 = divide
 */

List<String> operations = [Constants.add, Constants.minus];

class OneBlockQuestions {
  Random random = Random();

  String operationGenerator() {
    int operateVar = random.nextInt(2);
    if (operateVar == 0)
      return Constants.add;
    else
      return Constants.minus;
  }

  int var1Generator() {
    return random.nextInt(10);
  }

  int var2Generator() {
    return random.nextInt(10);
  }

  resultGenerator(int var1, int var2, String operation) {
    if (operation == Constants.add) {
      return var1 + var2;
    } else
      return var1 - var2;
  }

  int choiceGenerator() {
    // 0 = var2, 1 = operation, 2 = var2, 3 = result
    return random.nextInt(4);
  }

  dynamic answerGenerator(
      int choice, int var1, String operation, int var2, int result) {
    if (choice == 0)
      return var1;
    else if (choice == 1)
      return operation;
    else if (choice == 2)
      return var2;
    else
      return result;
  }

  int ansButtonSelector() {
    return random.nextInt(2); //total number of buttons
  }

//
  int intOptionGenerator(int restrict, int range) {
    int val = random.nextInt(range);
    if (val == restrict)
      return intOptionGenerator(restrict, range);
    else
      return val;
  }
//
//
String operandOptionGenerator(String restrict, int range) {
    int val = random.nextInt(range);
    if (operations[val] == restrict)
      return operandOptionGenerator(restrict, range);
    else
      return operations[val];
  }
//

  dynamic opt1Generator(choice, answer, buttonSelected) {
    if (buttonSelected == 0) {
      return answer;
    } else {
      if (choice == 1 && buttonSelected!=0)
        return operandOptionGenerator(answer, 2);
      else
        return random.nextInt(9);
    }
  }

dynamic opt2Generator(choice, answer, buttonSelected, opt1) {
    if (buttonSelected == 1) {
      return answer;
    } else {
      if (choice == 1){
        return operandOptionGenerator(opt1, 2);
        }
      else
        return intOptionGenerator(opt1, 9);
    }
  } 
}
