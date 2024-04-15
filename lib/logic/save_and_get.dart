import 'package:shared_preferences/shared_preferences.dart';

class SaveAndGet {
  saveOneBlockScore(int score) async {
    SharedPreferences scorePref = await SharedPreferences.getInstance();
    scorePref.setInt('ONE_BLOCK_SCORE', score);
  }

  getOneBlockScore() async {
    SharedPreferences scorePref = await SharedPreferences.getInstance();
    int score = scorePref.getInt('ONE_BLOCK_SCORE') ?? 0;
    return score;
  }

  saveTwoBlockScore(int score) async {
    SharedPreferences scorePref = await SharedPreferences.getInstance();
    scorePref.setInt('TWO_BLOCK_SCORE', score);
  }

  getTwoBlockScore() async {
    SharedPreferences scorePref = await SharedPreferences.getInstance();
    int score = scorePref.getInt('TWO_BLOCK_SCORE') ?? 0;
    return score;
  }
}
