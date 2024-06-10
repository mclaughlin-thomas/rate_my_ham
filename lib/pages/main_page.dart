import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_ham/util/tinder_card.dart';



class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String imageUrl1;
  late String imageUrl2;
  late String imageUrl3;
  late String imageUrl4;
  late String imageUrl5;
  late String imageUrl6;
  late String imageUrl7;
  late String imageUrl8;
  late String imageUrl9;
  late String imageUrl10;
  

  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    // set the initial value of the image url to empty string
    imageUrl1 = '';
    imageUrl2 = '';
    imageUrl3 = '';
    imageUrl4 = '';
    imageUrl5 = '';
    imageUrl6 = '';
    imageUrl7 = '';
    imageUrl8 = '';
    imageUrl9 = '';
    imageUrl10 = '';
    //retrieve the image url from firebase storage
    getImageUrl();
  }

  Future<void> getImageUrl() async {
    //get the reference to the mage file in Firebase storage
    final ref1 = storage.ref().child('emiham.jpg');
    final ref2 = storage.ref().child('ham.jpg');
    final ref3 = storage.ref().child('ham.jpg');
    final ref4 = storage.ref().child('ham.jpg');
    final ref5 = storage.ref().child('ham.jpg');
    final ref6 = storage.ref().child('ham.jpg');
    final ref7 = storage.ref().child('ham.jpg');
    final ref8 = storage.ref().child('ham.jpg');
    final ref9 = storage.ref().child('ham.jpg');
    final ref10 = storage.ref().child('ham.jpg');

    final url1 = await ref1.getDownloadURL();
    final url2 = await ref2.getDownloadURL();
    final url3 = await ref3.getDownloadURL();
    final url4 = await ref4.getDownloadURL();
    final url5 = await ref5.getDownloadURL();
    final url6 = await ref6.getDownloadURL();
    final url7 = await ref7.getDownloadURL();
    final url8 = await ref8.getDownloadURL();
    final url9 = await ref9.getDownloadURL();
    final url10 = await ref10.getDownloadURL();
    
    //Get the imageUrl to download URL
    setState(() {
      imageUrl1 = url1;
      imageUrl2 = url2;
      imageUrl3 = url3;
      imageUrl4 = url4;
      imageUrl5 = url5;
      imageUrl6 = url6;
      imageUrl7 = url7;
      imageUrl8 = url8;
      imageUrl9 = url9;
      imageUrl10 = url10;
    });
  }

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
                      SizedBox(height: 20),
                      Image(image: NetworkImage(imageUrl1), height: 100, width: 100),
                      Image(image: NetworkImage(imageUrl2), height: 100, width: 100),
                      // Container(
                      //   height: 500,
                      //   width: 320,
                      //   child: Stack(
                      //     children: [
                      //       TinderCard(imagePath: 'lib/images/emiham.jpg', userName: user_Name), //last picture
                      //       TinderCard(imagePath: 'lib/images/strangeham.jpg' , userName: user_Name),
                      //       TinderCard(imagePath: 'lib/images/ham.jpg' , userName: user_Name),
                      //       TinderCard(imagePath: 'lib/images/closeham.jpg' , userName: user_Name), //first picture
                      //     ],
                      //   ),
                      // ),
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