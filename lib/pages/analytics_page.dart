//analytics_page.dart
import 'package:flutter/material.dart';
import 'package:rate_my_ham/services/firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Analytics Page'),
      backgroundColor: Colors.pink[50], // Set the background color of the app bar
      iconTheme: IconThemeData(color: Colors.black), // Set the color of the icons (e.g., back button)
      titleTextStyle: TextStyle(
        color: Colors.black, // Set the color of the title text
        fontSize: 20.0, // Set the font size of the title text
        fontWeight: FontWeight.bold, // Set the font weight of the title text
      ),
    ),

      backgroundColor: Colors.pink[50],
      body: CustomPaint(
        painter: CirclePainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: FireStoreService().getFileNameWithMostLovedReviews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  String fileName = snapshot.data ?? 'No file found';
                  return FutureBuilder<String>(
                    future: FirebaseStorage.instance.ref().child(fileName).getDownloadURL(),
                    builder: (context, urlSnapshot) {
                      if (urlSnapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (urlSnapshot.hasError) {
                        return Center(child: Text('Error: ${urlSnapshot.error}'));
                      } else {
                        String imageUrl = urlSnapshot.data ?? '';
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                'Most Loved Image:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black, width: 7),
                                ),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
            SizedBox(height: 15),
            FutureBuilder<String>(
              future: FireStoreService().getFileNameWithLeastLovedReviews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  String fileName = snapshot.data ?? 'No file found';
                  return FutureBuilder<String>(
                    future: FirebaseStorage.instance.ref().child(fileName).getDownloadURL(),
                    builder: (context, urlSnapshot) {
                      if (urlSnapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (urlSnapshot.hasError) {
                        return Center(child: Text('Error: ${urlSnapshot.error}'));
                      } else {
                        String imageUrl = urlSnapshot.data ?? '';
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                'Most Liked Image:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black, width: 7),
                                ),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
