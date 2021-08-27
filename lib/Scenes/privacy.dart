import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'package:odds_viewer/Helper/constants.dart';


class PrivacyPolicyView extends StatefulWidget {

  WebViewController? webController;

  @override
  _PrivacyPolicyViewState createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Privacy Policy",
            style: TextStyle(
                color: OVColor.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
          ),
          iconTheme: IconThemeData(color: OVColor.textColor),
          backgroundColor: OVColor.themeColor,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          widget.webController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    )
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('Resources/privacy.html');
    widget.webController?.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }

}



