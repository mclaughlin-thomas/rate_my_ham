import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class TinderCard extends StatelessWidget {
  final String imagePath; // Replace with String for image path

  TinderCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Swipable(
      onSwipeRight: (finalPosition) {
        print(' Swiped right ');
        print(' image was loved ');
      },
      onSwipeLeft: (finalPosition) {
        print(' Swiped left ');
        print(' image was liked ');
      },
      verticalSwipe: false,
      child: Stack(
        children: [
          // Black border with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Image with slightly smaller rounded corners and inset padding
          ClipRRect(
            borderRadius: BorderRadius.circular(40), // Slightly smaller radius
            child: Padding(
              padding: const EdgeInsets.all(2.0), // Add padding for border
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}