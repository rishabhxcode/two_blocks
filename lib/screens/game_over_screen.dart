import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:two_blocks/ad_manager.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';

class GameOverScreen extends StatefulWidget {
  final int score;

  const GameOverScreen({Key key, this.score}) : super(key: key);
  @override
  _GameOverScreenState createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AdmobBanner(
            adUnitId: AdManager.bannerGameOverAdUnitId,
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, map) {
              if (event == AdmobAdEvent.failedToLoad) {
                print("Ad failed to load");
              }
              if (event == AdmobAdEvent.loaded) {
                print("Ad loaded");
              }
            },
          ),
          Expanded(child: Container()),
          Text('Your Score', style: TextStyle(fontSize: 30)),
          Text(
            '${widget.score ?? 0}',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          PlayAgainButton(),
          const SizedBox(),
          const SizedBox(),
          const SizedBox(),
          const SizedBox(),
          Expanded(child: Container()),
          AdmobBanner(
            adUnitId: AdManager.bannerGameOverAdUnitId,
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, map) {
              if (event == AdmobAdEvent.failedToLoad) {
                print("Ad failed to load previous wali");
              }
              if (event == AdmobAdEvent.loaded) {
                print("Ad loaded previous wali");
              }
            },
          ),
        ],
      ),
    );
  }
}

class PlayAgainButton extends StatelessWidget {
  final String text;

  const PlayAgainButton({Key key, this.text = 'Play Again'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeuButtonWidget(
      width: 200,
      height: 60,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      boundaryRadius: BorderRadius.all(Radius.circular(100)),
      fillColor: Constants.BGColor,
      highLightColor: Colors.grey[100],
      splashColor: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.play_arrow,
            size: 40,
            color: Colors.purple,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 21,
                color: Colors.deepOrange[700],
                fontWeight: FontWeight.w600),
          )
        ],
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
