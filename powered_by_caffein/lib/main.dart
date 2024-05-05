import 'package:flutter/material.dart';
import 'package:powered_by_caffein/Views/TestView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiled Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TiledMenu(),
    );
  }
}

class TiledMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double graphWidth = screenWidth * 2.45;
    double graphHeight = screenHeight * 1.08;
    bool alarm1 = false;
    bool alarm2 = false;
    bool alarm3 = true;
    bool alarm4 = false;
    bool alarm5 = false;
    bool alarm6 = false;
    bool alarm7 = false;
    final List<String> graphs = [
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>',
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>',
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>',
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>',
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>',
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>',
      '<iframe src="https://ignasidejose.grafana.net/d-solo/bdkpa3eaqkj5sb/batet-dashboard?orgId=1&from=1714838660207&to=1714860260208&theme=light&panelId=1" width="$graphWidth" height="$graphHeight" frameborder="0"></iframe>',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: screenHeight * 0.075,
            left: screenWidth * 0.35,
            child: MenuButton(
              id: 1,
              image: 'assets/icon1.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
              text: 'Heat',
              alarm: alarm1,
              graph: graphs[0],
            ),
          ),
          Positioned(
            top: screenHeight * 0.175,
            left: screenWidth * 0.025,
            child: MenuButton(
              id: 2,
              image: 'assets/icon2.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
              text: 'Humidity',
              alarm: alarm2,
              graph: graphs[1],
            ),
          ),
          Positioned(
            top: screenHeight * 0.40,
            left: screenWidth * 0.35,
            child: MenuButton(
              id: 3,
              image: 'assets/icon3.jpg',
              width: screenWidth * 0.625,
              height: screenHeight * 0.175,
              text: 'Noise',
              alarm: alarm3,
              graph: graphs[2],
            ),
          ),
          Positioned(
            top: screenHeight * 0.175,
            left: screenWidth * 0.675,
            child: MenuButton(
              id: 4,
              image: 'assets/icon4.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
              text: 'Placeholder',
              alarm: alarm4,
              graph: graphs[3],
            ),
          ),
          Positioned(
            top: screenHeight * 0.50,
            left: screenWidth * 0.025,
            child: MenuButton(
              id: 5,
              image: 'assets/icon5.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
              text: 'Placeholder',
              alarm: alarm5,
              graph: graphs[4],
            ),
          ),
          Positioned(
            top: screenHeight * 0.60,
            left: screenWidth * 0.35,
            child: MenuButton(
              id: 6,
              image: 'assets/icon6.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
              text: 'Placeholder',
              alarm: alarm6,
              graph: graphs[5],
            ),
          ),
          Positioned(
            top: screenHeight * 0.60,
            left: screenWidth * 0.675,
            child: MenuButton(
              id: 7,
              image: 'assets/icon7.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
              text: 'Placeholder',
              alarm: alarm7,
              graph: graphs[6],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final int id;
  final String image;
  final double width;
  final double height;
  final String text;
  final bool alarm;
  final String graph;

  MenuButton({
    required this.id,
    required this.image,
    required this.width,
    required this.height,
    required this.text,
    required this.alarm,
    required this.graph,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HelpScreen(graph: graph, id: id)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Image.asset(
                  color: alarm
                      ? Color.fromARGB(253, 155, 5, 5)
                      : Color.fromARGB(220, 255, 255, 255),
                  colorBlendMode: BlendMode.modulate,
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: alarm
                          ? Color.fromARGB(255, 95, 1, 1)
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
                    text: text,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
