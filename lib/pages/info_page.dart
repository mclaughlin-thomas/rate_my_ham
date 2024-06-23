//info_page.dart
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
        backgroundColor: Colors.pink[50], // Set the background color of the app bar
        iconTheme: IconThemeData(color: Colors.black), // Set the color of the icons (e.g., back button)
        titleTextStyle: TextStyle(
          color: Colors.black, // Set the color of the title text
          fontSize: 20.0, // Set the font size of the title text
          fontWeight: FontWeight.bold, // Set the font weight of the title text
        ),
      ),
      backgroundColor: Colors.pink[50],
      body: Stack(
        children: [
          CustomPaint(
            painter: CirclePainter(),
            child: Container(),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0), // Add padding to the sides
              child: Text(
                'Hello !\n\nMy name is Thomas McLaughlin and I am a Computer Science student at Saint Vincent College. I have no formal training with flutter or any other mobile development platform, but I taught myself enough (with the help of YouTube) to be able to make a working product that my girlfriend would find amusing, and also to prove I am capable of working with unfamiliar technologies.\n\nMy hope is that whoever views this application will have a good laugh and find it enjoyable, and that it will serve as a testament to my ability to learn and adapt to new technologies.\n\nThank you for your time!\n\n-Thomas McLaughlin\n\n',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, // Center-align the text
              ),
              
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
