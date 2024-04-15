import 'package:admob_flutter/admob_flutter.dart';
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
  //BannerAd _bannerAdBottom, _bannerAdTop;
  int oneBlockHighScore = 0;
  int twoBlockHighScore = 0;
  late AdmobBannerSize _bannerAdSize;

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
    _bannerAdSize = AdmobBannerSize.BANNER;
    // _bannerAdBottom = _createBannerAd();
    // _bannerAdTop = _createTestBannerAd();
    // _loadBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    // _bannerAdBottom?.dispose();
    // _bannerAdTop?.dispose();
    super.dispose();
  }

  Admob _initializeAdmob() {
    //return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
    return Admob.initialize(testDeviceIds: [AdManager.appId]);
  }

  // BannerAd _createBannerAd() {
  //   return BannerAd(adUnitId: AdManager.bannerAdUnitId, size: AdSize.banner);
  // }

  // BannerAd _createTestBannerAd() {
  //   return BannerAd(
  //       adUnitId: "ca-app-pub-3940256099942544/4339318960",
  //       size: AdSize.fullBanner);
  // }

  // void _loadBannerAd() {
  //   _bannerAdBottom
  //     ..load()
  //     ..show(anchorType: AnchorType.bottom);
  //   _bannerAdTop
  //     ..load()
  //     ..show(anchorType: AnchorType.top);
  // }
  String testBannerId() {
    return "ca-app-pub-3940256099942544/4339318960";
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container()),
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
          Expanded(child: Container()),
          AdmobBanner(
            adUnitId: AdManager.bannerHighScoreAdUnitId,
            adSize: _bannerAdSize,
            listener: (AdmobAdEvent event, map) {
              if (event == AdmobAdEvent.failedToLoad) {
                print("Bottom Ad failed to load ");
              }
              if (event == AdmobAdEvent.loaded) {
                print("Bottom Ad loaded ");
              }
            },
          ),
        ],
      ),
    );
  }
}
