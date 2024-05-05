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
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  //..loadHtmlString('<h1>Hello World!<h1>');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double graphWidth = screenWidth * 2.45;
    double graphHeight = screenHeight * 1.08;

    controller.loadHtmlString(
        '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>');
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
            Colors.grey.shade400,
          ],
          stops: [0.5, 0.5, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text('id: ${widget.id}'),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.4,
                child: WebViewWidget(controller: controller)),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(width: 40),
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      softWrap: true,
                      'Do Something',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Explanation of what doing something actually does, like it may actually be kinda long so let me just write a bit to test it',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                  onPressed: _onPressed1, child: const Icon(Icons.arrow_forward)),
              const SizedBox(width: 40),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(width: 40),
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      softWrap: true,
                      'Do Something Else',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Explanation of what doing something else actually does, like it may actually be kinda long so let me just write a bit to test it',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                  onPressed: _onPressed2, child: const Icon(Icons.arrow_forward)),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    ));
  }

  void _onPressed1() {
    print('Button 1 pressed');
  }

  void _onPressed2() {
    print('Button 2 pressed');
  }
}
