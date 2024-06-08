import 'package:flutter/material.dart';
import 'package:rate_my_ham/util/tinder_card.dart';



class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String user_Name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              painter: CirclePainter(),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SingleChildScrollView( // Wrap your Column with SingleChildScrollView
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.data_exploration_rounded ),
                            iconSize: 50.0,
                            color: Colors.black,
                            onPressed: () {},
                          ),
                          SizedBox(width: 1),
                          IconButton(
                            icon: Icon(Icons.info_rounded),
                            iconSize: 50.0,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/info'
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 500,
                        width: 320,
                        child: Stack(
                          children: [
                            TinderCard(imagePath: 'lib/images/emiham.jpg', userName: user_Name), //last picture
                            TinderCard(imagePath: 'lib/images/strangeham.jpg' , userName: user_Name),
                            TinderCard(imagePath: 'lib/images/ham.jpg' , userName: user_Name),
                            TinderCard(imagePath: 'lib/images/closeham.jpg' , userName: user_Name), //first picture
                          ],
                        ),
                      ),
                      SizedBox(height: 20), // Add some space between the stack and the buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_down, color: Colors.red, size: 50.0),
                            onPressed: () {
                              // Handle thumbs down action
                            },
                          ),
                          SizedBox(width: 50),
                          IconButton(
                            icon: Icon(Icons.thumb_up, color: Colors.green, size: 50.0),
                            onPressed: () {
                              // Handle thumbs up action
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // add two buttons here 
        
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