import 'dart:io';

class AdHelper {
  bool testing = false;

  AdHelper({this.testing = false});

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      if (testing) {
        return 'ca-app-pub-3940256099942544/6300978111';
      }
      return 'ca-app-pub-7617959947937744/9010474211';
    } else if (Platform.isIOS) {
      if (testing) {
        return 'ca-app-pub-3940256099942544/2934735716';
      }
      return 'ca-app-pub-7617959947937744/3620164709';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
