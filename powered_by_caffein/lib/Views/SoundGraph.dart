import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class SoundGraph extends StatefulWidget {
  final String graph;
  final int id;
  const SoundGraph({super.key, required this.graph, required this.id});

  @override
  State<SoundGraph> createState() => _SoundGraphState();
}

class _SoundGraphState extends State<SoundGraph> {
  double _value = 0.0;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  //..loadHtmlString('<h1>Hello World!<h1>');

  double valueToHz() {
    double Hz = ((_value) * 1000)+1500;
    return Hz-Hz%1;
  }
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
          Slider(value: _value, onChanged: _onChanged),
          const SizedBox(height: 40),
          Text(valueToHz().toString()),
          const SizedBox(height: 40),
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

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }
}
