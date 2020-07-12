import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      //todo: Don't show id like this implement env file
      return "ca-app-pub-5910340737637404~6746259296";
    } else if (Platform.isIOS) {
      //todo: change this id when launching for ios
      return "ca-app-pub-3940256099942544~2594085930";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerGameOverAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5910340737637404/2923113096";
    } else if (Platform.isIOS) {
      //todo: change this id when launching for ios
      return "ca-app-pub-3940256099942544/4339318960";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

static String get bannerHighScoreAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5910340737637404/3770125058";
    } else if (Platform.isIOS) {
      //todo: change this id when launching for ios
      return "ca-app-pub-3940256099942544/4339318960";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      //todo: change this id when creating this ad
      return "ca-app-pub-3940256099942544/7049598008";
    } else if (Platform.isIOS) {
      //todo: change this id when launching for ios
      return "ca-app-pub-3940256099942544/3964253750";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      //todo: change this id when creating this ad
      return "ca-app-pub-3940256099942544/8673189370";
    } else if (Platform.isIOS) {
      //todo: change this id when launching for ios
      return "ca-app-pub-3940256099942544/7552160883";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
