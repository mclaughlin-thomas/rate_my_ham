import 'package:flutter/material.dart';
import 'package:rate_my_ham/pages/main_page.dart';

class TermsWelcome extends StatelessWidget {
  const TermsWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar( title: const Text('Terms and Conditions'),),
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(20),
          child: Text(
            "Welcome to Rate My Ham",
          ),
        ),
      
        // child: ElevatedButton(
        //   child: Text("Lets Go!"),
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/main');
        //   },
        // ),
      ),
    );
  }
}