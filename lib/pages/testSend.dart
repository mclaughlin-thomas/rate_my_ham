import 'package:flutter/material.dart';
import 'package:rate_my_ham/services/firestore.dart'; //FB
 
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  final FireStoreService fireStoreService = FireStoreService(); //FB

  final TextEditingController textController = TextEditingController();


  void openRateBox(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //button sends
          ElevatedButton(
            onPressed: () {
              fireStoreService.createReview("picture1", textController.text); //FB

              //clear the text
              textController.clear();
              Navigator.pop(context);
            },
            child: Text("Send")
          )
        ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Rating'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openRateBox,
        child: const Icon(Icons.add),
      ),

    );
  }
}