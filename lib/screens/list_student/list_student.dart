import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListStudents extends StatelessWidget {
  ListStudents({super.key});

  final CollectionReference firedata =
    FirebaseFirestore.instance.collection('studentdatas');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: firedata.orderBy('Name').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error loading student data"),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot data = snapshot.data!.docs[index];
                  return Card(
                    child: Column(
                      children: [
                        Text(
                          'Name : ${data['Name']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          'Age : ${data['Age']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          'Address : ${data['Address']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          'Phone : ${data['Phone']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
