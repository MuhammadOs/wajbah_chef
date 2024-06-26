import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({Key? key, required this.chef_id}) : super(key: key);
  final String chef_id;

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> {
  late WebViewController _controller;
  late String _webviewLink;
  bool _isWebviewReady = false;

  @override
  void initState() {
    super.initState();
    _webviewLink = "https://lookerstudio.google.com/embed/u/0/reporting/0982ea8e-b4a3-4b2d-972f-858e0beb1faa/page/p_3hqiumqdid?params=%7B%22df76%22:%22include%25EE%2580%25800%25EE%2580%2580IN%25EE%2580%2580${widget.chef_id}%22%7D";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Finance'),
            Expanded(
              child: WebView(
                initialUrl: _webviewLink,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                  _initializeWebView();
                },
                onPageFinished: (_) {
                  _controller.evaluateJavascript("""
                    document.body.style.width = '100%';
                    document.body.style.height = '100%';
                    document.body.style.overflow = 'hidden';
                    document.documentElement.style.overflow = 'hidden';
                  """);
                },
                onPageStarted: (_) {
                  setState(() {
                    _isWebviewReady = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _initializeWebView() async {
    setState(() {
      _isWebviewReady = false;
    });

    // Load initial URL with the chef_id
    await _controller.loadUrl(_webviewLink);

    setState(() {
      _isWebviewReady = true;
    });
  }
}
