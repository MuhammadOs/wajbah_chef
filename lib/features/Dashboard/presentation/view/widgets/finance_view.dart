import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({Key? key}) : super(key: key);

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> {
  late WebViewController _webViewController;
  final _webviewLink = "https://flutter.dev"; // Initial URL to load

  @override
  void initState() {
    super.initState();
    // Enable WebView for Android
    WebView.platform = SurfaceAndroidWebView();
    // For iOS use:
    // WebView.platform = CupertinoWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Finance View'),
            Expanded(
              child: WebView(
                initialUrl: _webviewLink,
                javascriptMode: JavascriptMode.unrestricted,
                // Enable JavaScript
                onWebViewCreated: (WebViewController webViewController) {
                  _webViewController = webViewController;
                },
                onPageStarted: (String url) {
                  // Handle page load started
                },
                onPageFinished: (String url) {
                  // Handle page load finished
                },
                onWebResourceError: (WebResourceError error) {
                  // Handle web resource errors
                },
                navigationDelegate: (NavigationRequest request) {
                  // Handle navigation requests
                  return NavigationDecision.navigate;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
