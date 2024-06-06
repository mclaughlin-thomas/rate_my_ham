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
              TinderCard(imagePath: 'lib/images/emiham.jpg'),
              TinderCard(imagePath: 'lib/images/strangeham.jpg'),
              TinderCard(imagePath: 'lib/images/ham.jpg'),
              TinderCard(imagePath: 'lib/images/closeham.jpg'),
            ],
          ),
        )
        
      ),
      
    );
  }
}