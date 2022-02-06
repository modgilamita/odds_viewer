import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OVColor {
  static final themeColor = false ? Color(0xFF1E2250) : Color(0xFFFFFFFF);
  static final textColor = false ? Color(0xFFFFFFFF) : Color(0xFF1E2250);
  static final bg1Color = false ? Color(0xFFFFFFFF) : Color(0xFFEFEFEF);
  static final bg2Color = false ? Color(0xFFFFFFFF) : Color(0xFFF5F5F5);
}

class OVAssets {
  static final contact =
      false ? "assets/icons/contact.png" : "assets/icons/contact_active.png";
  static final cricket =
      false ? "assets/icons/cricket.png" : "assets/icons/cricket_active.png";
  static final news =
      false ? "assets/icons/news.png" : "assets/icons/news_active.png";
  static final live =
      false ? "assets/icons/live1.png" : "assets/icons/live_active.png";
  static final feedback =
      false ? "assets/icons/feedback.png" : "assets/icons/feedback_active.png";
  static final football =
      false ? "assets/icons/football.png" : "assets/icons/football_active.png";
  static final pointTable =
      false ? "assets/icons/point.png" : "assets/icons/point-active.png";
  static final upcoming =
      false ? "assets/icons/upcoming.png" : "assets/icons/upcoming_active.png";
  static final iccRanking =
      false ? "assets/icons/trophy.png" : "assets/icons/trophy-active.png";
  static final settings =
      false ? "assets/icons/settings.png" : "assets/icons/settings_active.png";
  static final logo =
      false ? "assets/icons/new-logo.png" : "assets/icons/brand-new-logo.png";
  static final appStoreIcon = "assets/icons/app_store.png";
  static final playStoreIcon = "assets/icons/play_store.png";
  static final whatsAppIcon = "assets/icons/whats_app.png";
  static final facebookIcon = "assets/icons/facebook.png";
  static final twitterIcon = "assets/icons/twitter.png";
  static final instagramIcon = "assets/icons/instagram.png";
}

class OVTextStyle {
  static boldTitle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: OVColor.textColor,
    );
  }

  static normalTitle() {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: OVColor.textColor,
    );
  }
}
