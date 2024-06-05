import 'package:flutter/material.dart';
import 'package:rate_my_ham/util/tinder_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 320,
          child: Stack(
            children: [
              TinderCard(color: Colors.red),
              TinderCard(color: Colors.green),
              TinderCard(color: Colors.blue),
            ],
          ),
        )
        
      ),
      
    );
  }
}