

import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

String webviewLink = "https://flutter.dev";
final webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
  ..setBackgroundColor(wajbah_primary)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String webviewLink) {},
      onPageFinished: (String webviewLink) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {

        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(webviewLink));