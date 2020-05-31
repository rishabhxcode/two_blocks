import 'package:shared_preferences/shared_preferences.dart';

class SaveAndGet {
  saveStore(int score) async {
    SharedPreferences scorePref = await SharedPreferences.getInstance();
    scorePref.setInt('SCORE', score);
  }

  getScore() async {
    SharedPreferences scorePref = await SharedPreferences.getInstance();
    int score = scorePref.getInt('SCORE');
    return score;
  }
}
