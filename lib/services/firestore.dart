//firestore.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService{

  final CollectionReference reviews = FirebaseFirestore.instance.collection('reviews');

  //create: send review to firestore
  Future<void> createReview(String file_name, String user_name, String review) {
    return reviews.add({
      'file_name': file_name,
      'user_name': user_name,
      'review': review,
      'timestamp': Timestamp.now(),
    });
  }

   //getFileNameWithMostLovedReviews: retrieve filename with highest count of "love" reviews
  Future<String> getFileNameWithMostLovedReviews() async {
    QuerySnapshot snapshot =
        await reviews.where('review', isEqualTo: 'love').get();

    Map<String, int> fileNameCountMap = {};

    snapshot.docs.forEach((doc) {
      String fileName = (doc.data() as Map<String, dynamic>)['file_name'];

      fileNameCountMap[fileName] = (fileNameCountMap[fileName] ?? 0) + 1;
    });

    String fileNameWithMostLovedReviews = '';
    int maxCount = 0;

    fileNameCountMap.forEach((fileName, count) {
      if (count > maxCount) {
        fileNameWithMostLovedReviews = fileName;
        maxCount = count;
      }
    });

    return fileNameWithMostLovedReviews;
  }

  //getFileNameWithLeastLovedReviews: retrieve filename with lowest count of "love" reviews
  Future<String> getFileNameWithLeastLovedReviews() async {
    QuerySnapshot snapshot =
        await reviews.where('review', isEqualTo: 'like').get();

    Map<String, int> fileNameCountMap = {};

    snapshot.docs.forEach((doc) {
      String fileName = (doc.data() as Map<String, dynamic>)['file_name'];

      fileNameCountMap[fileName] = (fileNameCountMap[fileName] ?? 0) + 1;
    });

    String fileNameWithMostLovedReviews = '';
    int maxCount = 0;

    fileNameCountMap.forEach((fileName, count) {
      if (count > maxCount) {
        fileNameWithMostLovedReviews = fileName;
        maxCount = count;
      }
    });

    return fileNameWithMostLovedReviews;
  }


}