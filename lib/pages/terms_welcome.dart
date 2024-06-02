import 'package:flutter/material.dart';
import 'dart:math';

class TermsWelcome extends StatelessWidget {
  const TermsWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to Rate My Ham!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 31,
                          fontFamily: 'Allura',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10), // Adjust the spacing between the two text widgets
                      Text(
                        "Discover your purrfect match with Rate My Ham, the ultimate Tinder-style app for kitten lovers! Swipe right on the kittens you love and left on the kittens you like (because all kittens here are winners)! Browse through currated photos of cute Ham and allow Rate My Ham to collect your insights on the Ham pictures you enjoy most. Rate My Ham is the easiest and most fun way to view pictures of Ham!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 55), // Adjust the spacing between the two text widgets
                      Text(
                        "This app was created for my girlfriend and our kitten, Ham, whom I love both dearly",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50), // Add space of 20 logical pixels
                ElevatedButton(
                  child: Text(
                    "Let's Go!",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 240, 146, 224),
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final double circleRadius = 10.0; // Radius of the circles
    final double spacing = 20.0; // Spacing between circles

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), circleRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
