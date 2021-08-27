import 'dart:io' show Platform;
import 'package:odds_viewer/Helper/constants.dart';

class Util {
  static String deviceStoreName() {
    return Platform.isIOS ? "App Store " : "Play Store";
  }
  static String storeIcon() {
    return Platform.isIOS ? OVAssets.appStoreIcon : OVAssets.playStoreIcon;
  }
}