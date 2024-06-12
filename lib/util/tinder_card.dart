import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:rate_my_ham/services/firestore.dart';

class TinderCard extends StatelessWidget {
  final String imagePath;
  final String userName;
  final VoidCallback onSwipe;
  final FireStoreService fireStoreService = FireStoreService();

  TinderCard({required this.imagePath, required this.userName, required this.onSwipe});

  String getLastPartOfPath(String path) {
    path = path.split('/').last;
    int questionMarkIndex = path.indexOf('?');
    if (questionMarkIndex == -1) {
      return path; // Return the whole string if there's no '?'
    }
    return path.substring(0, questionMarkIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      onSwipeRight: (finalPosition) {
        print('Swiped right');
        fireStoreService.createReview(getLastPartOfPath(imagePath), userName, "love");
        print('Image was loved');
        onSwipe();
      },
      onSwipeLeft: (finalPosition) {
        print('Swiped left');
        fireStoreService.createReview(getLastPartOfPath(imagePath), userName, "like");
        print('Image was liked');
        onSwipe();
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
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Center(child: Icon(Icons.error));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
