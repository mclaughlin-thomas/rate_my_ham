import 'package:flutter/material.dart';

class SelectUserName extends StatelessWidget {
  const SelectUserName({super.key});

  @override
  
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CirclePainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Enter your name :)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 180, 167, 167), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusColor: Colors.black,
                    floatingLabelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)), // Ensures the label text is black when focused

                  ),
                  
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String user_name = _controller.text;
                    Navigator.pushNamed(
                      context,
                      '/main',
                      arguments: user_name,
                    );
                  },
                  child: const Text('OK'),
                ),
                Container(
                  height: 120,
                  width: 200,
                  child:
                    Image.asset('lib/images/flower.png')
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
