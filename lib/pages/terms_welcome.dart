import 'package:flutter/material.dart';

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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.pink[100],
                  ),
                  height: 500,
                  width: 350,
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
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      //SizedBox(height: 55), // Adjust the spacing between the two text widgets
                      Container(
                        height: 120,
                        width: 200,
                        child:
                          Image.asset('lib/images/kittenPlay.png')
                      ),
                      Text(
                        "This app was created for my girlfriend and our kitten, Ham, whom I love both dearly.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.3,
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
                    backgroundColor: Colors.pink[100],
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_user_name');
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
