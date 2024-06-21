import 'package:flutter/material.dart';
import 'package:rate_my_ham/services/firestore.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<String>(
            future: FireStoreService().getFileNameWithMostLovedReviews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                String fileName = snapshot.data ?? 'No file found';
                return Center(child: Text('File with most love reviews: $fileName'));
              }
            },
          ),
          FutureBuilder<String>(
            future: FireStoreService().getFileNameWithLeastLovedReviews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                String fileName = snapshot.data ?? 'No file found';
                return Center(child: Text('File with least love reviews: $fileName'));
              }
            },
          ),
        ],
      ),
    );
  }
}
