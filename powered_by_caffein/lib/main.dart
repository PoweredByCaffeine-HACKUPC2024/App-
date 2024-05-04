import 'package:flutter/material.dart';
import 'package:powered_by_caffein/Views/TestView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: screenHeight * 0.025,
            left: screenWidth * 0.35,
            child: MenuButton(
              image: 'assets/icon1.jpg',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HelpScreen()));
              },
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.125,
            left: screenWidth * 0.025,
            child: MenuButton(
              image: 'assets/icon2.jpg',
              onPressed: () {},
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth * 0.35,
            child: MenuButton(
              image: 'assets/icon3.jpg',
              onPressed: () {},
              width: screenWidth * 0.625,
              height: screenHeight * 0.15,
            ),
          ),
          Positioned(
            top: screenHeight * 0.075,
            left: screenWidth * 0.675,
            child: MenuButton(
              image: 'assets/icon4.jpg',
              onPressed: () {},
              width: screenWidth * 0.3,
              height: screenHeight * 0.25,
            ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * 0.025,
            child: MenuButton(
              image: 'assets/icon5.jpg',
              onPressed: () {},
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.525,
            left: screenWidth * 0.35,
            child: MenuButton(
              image: 'assets/icon6.PNG',
              onPressed: () {},
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.525,
            left: screenWidth * 0.675,
            child: MenuButton(
              image: 'assets/icon7.png',
              onPressed: () {},
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String image;
  final Function() onPressed;
  final double width;
  final double height;

  MenuButton({
    required this.image,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: width,
            height: height,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
