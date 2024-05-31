import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:student_application_getx/screens/add_student/add_student.dart';
import 'package:student_application_getx/screens/list_student/list_student.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 128, 145),
        title: const Center(
          child: Text(
            "STUDENTS REGISTER",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                      'images/group-six-indian-businessman-suits-posed-outdoor-winter-day-europe-looking-laptop.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                // color: Colors.amber,
                child: ListStudents(),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(AddStudents());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Student"),
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
