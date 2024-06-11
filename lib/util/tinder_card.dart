import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:rate_my_ham/services/firestore.dart'; //FB



class TinderCard extends StatelessWidget {
  final String imagePath;
  final String userName;
  final FireStoreService fireStoreService = FireStoreService();

  TinderCard({required this.imagePath, required this.userName});

  String getLastPartOfPath(String path) {
    return path.split('/').last;
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      onSwipeRight: (finalPosition) {
        print('Swiped right');
        fireStoreService.createReview(getLastPartOfPath(imagePath), userName, "love");
        print('Image was loved');
      },
      onSwipeLeft: (finalPosition) {
        print('Swiped left');
        fireStoreService.createReview(getLastPartOfPath(imagePath), userName, "like");
        print('Image was liked');
      },
      verticalSwipe: false,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                // I DID NOT WRITE THE BELOW CODE
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  
                  double? progressValue;
                  if (loadingProgress.expectedTotalBytes != null) {
                    progressValue = loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1);
                  } else {
                    progressValue = null;
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      value: progressValue,
                    ),
                  );

                },
                // I DID NOT WRITE THE ABOVE CODE
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Center(
                    child: Icon(Icons.error)
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}