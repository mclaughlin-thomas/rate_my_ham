import 'package:flutter/material.dart';

class TermsWelcome extends StatelessWidget {
  const TermsWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar( title: const Text('Terms and Conditions'),),
      backgroundColor: Colors.pink[50],
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
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
                      fontSize: 26,
                      fontFamily: 'Allura',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Adjust the spacing between the two text widgets
                  Text(
                    "Lor em Ip sum Lor em Ips uLor em IpsuL orem IpsuLo rem IpsuLo rem IpsuL orem IpsuLorem IpsuL orem IpsuLorem IpsuLorem Ipsu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      // Add additional styles if needed
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50), // Add space of 20 logical pixels
            ElevatedButton(
              child: Text(
                "Lets Go!",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 240, 146, 224),
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)
              ),


              onPressed: () {
                Navigator.pushNamed(context, '/main');
              },
            ),


          ],
        ),
      ),
    );
  }
}