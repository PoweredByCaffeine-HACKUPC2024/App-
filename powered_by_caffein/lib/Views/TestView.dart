import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class HelpScreen extends StatefulWidget {
  final String graph;
  final int id;
  const HelpScreen({super.key, required this.graph, required this.id});

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

    controller.loadHtmlString(widget.graph);
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
                  onPressed: _onPressed1,
                  child: const Icon(Icons.arrow_forward)),
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
                  onPressed: _onPressed2,
                  child: const Icon(Icons.arrow_forward)),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    ));
  }

  Future<void> _onPressed1() async {
    String url = 'http://10.4.246.167/builtinLed/on';
  
  try {
    var response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      print('Request successful');
      // You can handle the response here if needed
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error making GET request: $e');
  }
  }

  Future<void> _onPressed2() async {
    String url = 'http://10.4.246.167/builtinLed/off';
  
  try {
    var response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      print('Request successful');
      // You can handle the response here if needed
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error making GET request: $e');
  }
  }
}
