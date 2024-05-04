import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpScreen extends StatefulWidget {
  final int id;
  const HelpScreen({super.key, required this.id});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //..loadHtmlString('<h1>Hello World!<h1>');
    ..loadHtmlString(
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714824640785&to=1714846240786&panelId=1" width="1450" height="900" frameborder="0"></iframe>');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: controller), /*Column(
        children: [
          Text('id: ${widget.id}'),
          SizedBox(
            height: 300,
            width: 300,
            child: WebViewWidget(controller: controller),
          ),
          // Add widgets below the WebView
        ],
      ),*/
    );
  }
}
