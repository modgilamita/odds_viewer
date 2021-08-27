
import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/Util.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:social_share/social_share.dart';
import 'package:flutter/services.dart';

class ShareScene extends StatefulWidget {
  const ShareScene({Key? key}) : super(key: key);

  @override
  _ShareSceneState createState() => _ShareSceneState();
}

class _ShareSceneState extends State<ShareScene> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Rate us and Share our app",
            style: TextStyle(
              color: OVColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          iconTheme: IconThemeData(color: OVColor.textColor),
          backgroundColor: OVColor.themeColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rate us on",
                        style: TextStyle(
                          color: OVColor.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          LaunchReview.launch(
                              androidAppId: "com.oddsviewer",
                              iOSAppId: "id284882215");
                        },
                        child: ActionItem(
                            title: Util.deviceStoreName(),
                            iconName: Util.storeIcon()),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Share app on",
                        style: TextStyle(
                          color: OVColor.textColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FlutterShareMe().shareToWhatsApp(msg: "OddsViewer - Cricket Live line\nhttps://play.google.com/store/apps/details?id=com.oddsviewer");
                            },
                            child: ActionItem(
                                title: "WhatsApp",
                                iconName: OVAssets.whatsAppIcon),
                          ),
                          Padding(padding: EdgeInsets.all(4),),
                          GestureDetector(
                            onTap: () {
                              FlutterShareMe().shareToFacebook(url: "https://play.google.com/store/apps/details?id=com.oddsviewer",
                                  msg: "OddsViewer - Cricket Live line");
                            },
                            child: ActionItem(
                                title: "Facebook",
                                iconName: OVAssets.facebookIcon),
                          ),
                          Padding(padding: EdgeInsets.all(4),),
                          GestureDetector(
                            onTap: () {
                              shareViaInstagram();
                            },
                            child: ActionItem(
                                title: "Instagram",
                                iconName: OVAssets.instagramIcon),
                          ),
                          Padding(padding: EdgeInsets.all(4),),
                          GestureDetector(
                            onTap: () {
                              FlutterShareMe().shareToTwitter(url: "https://play.google.com/store/apps/details?id=com.oddsviewer",
                              msg: "OddsViewer - Cricket Live line");
                            },
                            child: ActionItem(
                                title: "Twitter",
                                iconName: OVAssets.twitterIcon),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  shareViaInstagram() async {
    String fileText = await rootBundle.loadString(OVAssets.logo);
    print(fileText);
    SocialShare.shareInstagramStory(fileText);
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem({Key? key, required this.title, required this.iconName})
      : super(key: key);

  final String title;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Image.asset(iconName,
          width: 25,
          height: 25,
          fit: BoxFit.fill,),
          Padding(padding: EdgeInsets.all(4),),
          Text(
            title,
            style: TextStyle(
              color: OVColor.textColor,
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          )
        ],
      );
  }
}
