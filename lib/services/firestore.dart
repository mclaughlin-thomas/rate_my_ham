import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService{

  final CollectionReference reviews = FirebaseFirestore.instance.collection('reviews');

  //create: send review to firestore
  Future<void> createReview(String file_name, String review) {
    return reviews.add({
      'file_name': file_name,
      'review': review,
      'timestamp': Timestamp.now(),
    });
  }


}