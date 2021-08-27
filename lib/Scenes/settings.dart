import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Scenes/privacy.dart';

class SettingsScene extends StatefulWidget {
  bool isDarkThemeSelected = false;
  bool isPushNotificationEnabled = false;

  @override
  _SettingsSceneState createState() => _SettingsSceneState();
}

class _SettingsSceneState extends State<SettingsScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              color: OVColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 24.0),
        ),
        iconTheme: IconThemeData(color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
      ),
      body: Center(
          child: Card(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: OVColor.textColor),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Row(
                        children: [
                          Text(
                            "Dark Theme",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: OVColor.textColor,
                            ),
                          ),
                          Spacer(),
                          Switch(
                            value: widget.isDarkThemeSelected,
                            onChanged: (bool isOn) {
                              setState(() {
                                widget.isDarkThemeSelected = isOn;
                                darkThemeStatusUpdated();
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Row(
                        children: [
                          Text(
                            "Push Notifications",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: OVColor.textColor,
                            ),
                          ),
                          Spacer(),
                          Switch(
                            value: widget.isPushNotificationEnabled,
                            onChanged: (bool isOn) {
                              setState(() {
                                widget.isPushNotificationEnabled = isOn;
                                pushNotificationsStatusUpdated();
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PrivacyPolicyView()),
                                );
                              },
                              child: Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: OVColor.textColor,
                                  ),
                              )
                              )
                        ],
                      )
              )
          )
      ),
    );
  }

  void darkThemeStatusUpdated() {
    print("Dark Changed");
  }

  void pushNotificationsStatusUpdated() {
    print("Push Changed");
  }
}
