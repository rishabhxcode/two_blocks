import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:two_blocks/ad_manager.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/logic/save_and_get.dart';
import 'package:two_blocks/screens/game_over_screen.dart';

class HighScoresScreen extends StatefulWidget {
  @override
  _HighScoresScreenState createState() => _HighScoresScreenState();
}

class _HighScoresScreenState extends State<HighScoresScreen> {
  SaveAndGet sharedPref = SaveAndGet();
  BannerAd _bannerAd;

  int oneBlockHighScore = 0;
  int twoBlockHighScore = 0;

  get1BHighScore() async {
    oneBlockHighScore = await sharedPref.getOneBlockScore() ?? 0;
    setState(() {});
  }

  get2BHighScore() async {
    twoBlockHighScore = await sharedPref.getTwoBlockScore() ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    get1BHighScore();
    get2BHighScore();
    _initializeAdmob();
    _bannerAd = _createBannerAd();
    _loadBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  Future<void> _initializeAdmob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  BannerAd _createBannerAd() {
    return BannerAd(
        adUnitId: AdManager.bannerAdUnitId, size: AdSize.fullBanner);
  }

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  @override
  Widget build(BuildContext context) {
    print('build::HighScoresScreen()');
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('High Scores'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '1 Block',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              '$oneBlockHighScore',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700]),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              '2 Block',
              style: TextStyle(fontSize: 32),
            ),
            Text('$twoBlockHighScore',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700])),
            SizedBox(
              height: 80,
            ),
            PlayAgainButton(
              text: 'PLAY',
            ),
          ],
        ),
      ),
    );
  }
}
