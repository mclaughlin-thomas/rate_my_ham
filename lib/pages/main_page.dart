import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_ham/util/tinder_card.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoading = true;
  List<String> imageUrls = [];

  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    getImageUrls();
  }

  Future<void> getImageUrls() async {
    final ref1 = storage.ref().child('10.jpg');
    final ref2 = storage.ref().child('9.jpg');
    final ref3 = storage.ref().child('8.jpg');
    final ref4 = storage.ref().child('7.jpg');
    final ref5 = storage.ref().child('6.jpg');
    final ref6 = storage.ref().child('5.jpg');
    final ref7 = storage.ref().child('4.jpg');
    final ref8 = storage.ref().child('3.jpg');
    final ref9 = storage.ref().child('2.jpg');
    final ref10 = storage.ref().child('1.jpg');

    final urls = await Future.wait([
      ref1.getDownloadURL(),
      ref2.getDownloadURL(),
      ref3.getDownloadURL(),
      ref4.getDownloadURL(),
      ref5.getDownloadURL(),
      ref6.getDownloadURL(),
      ref7.getDownloadURL(),
      ref8.getDownloadURL(),
      ref9.getDownloadURL(),
      ref10.getDownloadURL(),
    ]);

    await Future.wait(urls.map((url) => precacheImage(NetworkImage(url), context)));

    setState(() {
      imageUrls = urls;
      isLoading = false;
    });
  }

  void handleSwipe() {
    setState(() {
      imageUrls.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String user_Name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Stack(
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.data_exploration_rounded),
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
                                    Navigator.pushNamed(context, '/info');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Container(
                              height: 500,
                              width: 320,
                              child: imageUrls.isEmpty
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "No images left :(",
                                            style: TextStyle(fontSize: 24, color: Colors.black),
                                          ),
                                          SizedBox(height: 40),
                                          Text(
                                            "Click below to view analytics of today's images !",
                                            style: TextStyle(fontSize: 14, color: Colors.black),
                                          ),
                                          SizedBox(height: 15),
                                          ElevatedButton(
                                            child: Text(
                                              "View Analytics !",
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
                                              Navigator.pushNamed(context, '/analytics');
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        for (var url in imageUrls)
                                          TinderCard(imagePath: url, userName: user_Name, onSwipe: handleSwipe),
                                      ],
                                    ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
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
