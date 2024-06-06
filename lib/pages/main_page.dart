import 'package:flutter/material.dart';
import 'package:rate_my_ham/util/tinder_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      
      
      // appBar: AppBar(
      //   title: const Text('Main Page'),
      // ),
      body: Center(
        child: Stack( // Use Stack for layering
          children: [
            // Background with CustomPainter
            CustomPaint(
              painter: CirclePainter(),
              child: Container(
                color: Colors.transparent, // Allow painting to show through
                width: double.infinity, // Fill entire width
                height: double.infinity, // Fill entire height
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.account_circle), // replace with your desired icon
                          iconSize: 50.0,
                          color: Colors.black,
                          onPressed: () {
                            // Add your navigation code here
                          },
                        ),
                        SizedBox(width: 1), // Add some space between the buttons
                        IconButton(
                          icon: Icon(Icons.info_rounded), // question mark icon
                          iconSize: 50.0,
                          color: Colors.black,
                          onPressed: () {
                            // Add your navigation code here
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 500,
                      width: 320,
                      child: Stack(
                        children: [
                          TinderCard(imagePath: 'lib/images/emiham.jpg'),
                          TinderCard(imagePath: 'lib/images/strangeham.jpg'),
                          TinderCard(imagePath: 'lib/images/ham.jpg'),
                          TinderCard(imagePath: 'lib/images/closeham.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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