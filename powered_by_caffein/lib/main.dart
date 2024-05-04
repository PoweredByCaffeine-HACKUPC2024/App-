import 'package:flutter/material.dart';
import 'package:powered_by_caffein/Views/TestView.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  join(await getDatabasesPath(), 'WorkSpaces.db'),
);
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
              id: 1,
              image: 'assets/icon1.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.125,
            left: screenWidth * 0.025,
            child: MenuButton(
              id: 2,
              image: 'assets/icon2.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth * 0.35,
            child: MenuButton(
              id: 3,
              image: 'assets/icon3.jpg',
              width: screenWidth * 0.625,
              height: screenHeight * 0.175,
            ),
          ),
          Positioned(
            top: screenHeight * 0.125,
            left: screenWidth * 0.675,
            child: MenuButton(
              id: 4,
              image: 'assets/icon4.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.2,
            ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * 0.025,
            child: MenuButton(
              id: 5,
              image: 'assets/icon5.jpg',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.55,
            left: screenWidth * 0.35,
            child: MenuButton(
              id: 6,
              image: 'assets/icon6.PNG',
              width: screenWidth * 0.3,
              height: screenHeight * 0.3,
            ),
          ),
          Positioned(
            top: screenHeight * 0.55,
            left: screenWidth * 0.675,
            child: MenuButton(
              id: 7,
              image: 'assets/icon7.png',
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
  final int id;
  final String image;
  final double width;
  final double height;

  MenuButton({
    required this.id,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HelpScreen(id: id)));
      },
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
              color: Color.fromARGB(179, 255, 255, 255),
              colorBlendMode: BlendMode.modulate,
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
