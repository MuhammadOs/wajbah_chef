import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({Key? key}) : super(key: key);

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> {
  final _controller = WebviewController();
  final _webviewLink = "https://lookerstudio.google.com/embed/u/0/reporting/2b2c64d3-8fef-4c74-84c2-26c8c993be2f/page/p_3hqiumqdid"; // Your initial URL
  bool _isWebviewReady = false;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    await _controller.initialize();
    if (!mounted) return;
    setState(() {
      _isWebviewReady = true;
    });

    _controller.url.listen((url) {
      // Handle URL changes if needed
    });

    await _controller.loadUrl(_webviewLink);
    // Inject JavaScript to adjust the zoom level
    await _controller.executeScript(
        "document.body.style.zoom = '10';"); // Adjust the zoom level as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Finance View'),
            Expanded(
              child: _isWebviewReady
                  ? Webview(_controller)
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
