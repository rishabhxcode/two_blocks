import 'package:two_blocks/constants.dart';
import 'dart:math';

class OneBlockQuestions {
  Random random = Random();
  List<String> operations = Constants.symbols;

  int option1Generator(restrict, range) {
    int val = random.nextInt(range);
    if (val == restrict)
      return option1Generator(restrict, range);
    else
      return val;
  }

  int option2Generator(restrict1, restrict2, range) {
    int val = random.nextInt(range);
    if (val == restrict1)
      return option2Generator(restrict1, restrict2, range);
    else if (val == restrict2)
      return option2Generator(restrict1, restrict2, range);
    else
      return val;
  }

  int option3Generator(restrict1, restrict2, restrict3, range) {
    int val = random.nextInt(range);
    if (val == restrict1)
      return option3Generator(restrict1, restrict2, restrict3, range);
    else if (val == restrict2)
      return option3Generator(restrict1, restrict2, restrict3, range);
    else if (val == restrict3)
      return option3Generator(restrict1, restrict2, restrict3, range);
    else
      return val;
  }

  int option4Generator(restrict1, restrict2, restrict3, restrict4, range) {
    int val = random.nextInt(range);
    if (val == restrict1)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else if (val == restrict2)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else if (val == restrict3)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else if (val == restrict4)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else
      return val;
  }

  String operationGenerator() {
    return operations[random.nextInt(2)];
  }

  int var1Generator(operation) {
    return random.nextInt(10);
  }

  int var2Generator(operation) {
    return random.nextInt(10);
  }

  int resultGenerator(String operand, int var1, int var2) {
    if (operand == Constants.add)
      return var1 + var2;
    else if (operand == Constants.minus)
      return var1 - var2;
    else if (operand == Constants.multiply)
      return var1 * var2;
    else
      return var1 ~/ var2;
  }

  int buttonSelected() {
    return random.nextInt(4);
  }

  int choiceSelected() {
    return random.nextInt(4);
  }

  dynamic answerGenerator(
      int choice, int var1, String operand, int var2, int result) {
    if (choice == 0)
      return var1;
    else if (choice == 1)
      return operand;
    else if (choice == 2)
      return var2;
    else
      return result;
  }

  dynamic opt1Generator(
      int buttonSelected, int choiceSelected, dynamic answer) {
    if (buttonSelected == 0) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        return temp[random.nextInt(temp.length)];
      } else
        return option1Generator(answer, 10);
    }
  }

  dynamic opt2Generator(
      int buttonSelected, int choiceSelected, dynamic answer, opt1) {
    if (buttonSelected == 1) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        temp.remove(opt1);
        return temp[random.nextInt(temp.length)];
      } else {
        return option2Generator(answer, opt1, 10);
      }
    }
  }

  dynamic opt3Generator(
      int buttonSelected, int choiceSelected, dynamic answer, opt1, opt2) {
    if (buttonSelected == 2) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        temp.remove(opt1);
        temp.remove(opt2);
        return temp[random.nextInt(temp.length)];
      } else {
        return option3Generator(answer, opt1, opt2, 10);
      }
    }
  }

  dynamic opt4Generator(int buttonSelected, int choiceSelected, dynamic answer,
      opt1, opt2, opt3) {
    if (buttonSelected == 3) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        temp.remove(opt1);
        temp.remove(opt2);
        temp.remove(opt3);
        return temp[random.nextInt(temp.length)];
      } else {
        return option4Generator(answer, opt1, opt2, opt3, 10);
      }
    }
  }

  checker(opt, var1, var2, result) {
    if (opt == Constants.add && var1 + var2 == result)
      return true;
    else if (opt == Constants.minus && var1 - var2 == result)
      return true;
    else if (opt == Constants.multiply && var1 * var2 == result)
      return true;
    else if (opt == Constants.divide && var1 ~/ var2 == result)
      return true;
    else
      return false;
  }
}
