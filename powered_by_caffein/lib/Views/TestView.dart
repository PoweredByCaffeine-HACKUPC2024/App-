import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpScreen extends StatefulWidget {
  final int id;
  const HelpScreen({super.key, required this.id});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  late final WebViewController _controller;

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadHtmlString(
        '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714814145595&to=1714835745595&panelId=1" width="450" height="200" frameborder="0"></iframe>');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: Column(
        children: [
          // Add widgets above the WebView
          Expanded(
            child: WebViewWidget(controller: controller),
          ),
          // Add widgets below the WebView
        ],
      ),
    );
  }
}
