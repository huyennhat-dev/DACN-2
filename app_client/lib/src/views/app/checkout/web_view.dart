import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final String url;

  MyWebView({required this.url});

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {},
        onPageFinished: (String url) {
          if (url.contains("success")) {
            Navigator.pushNamed(context, '/checkout-success');
          }
          if (url.contains("checkout/error")) {
            Navigator.pushNamed(context, '/checkout-error');
          }
        },
      ),
    );
  }
}
