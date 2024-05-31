import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddStudents extends StatelessWidget {
  AddStudents({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 34, 128, 145),
        title: const Center(
            child: Text(
          "ADD STUDENTS",
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(),
                            labelText: 'Name'),
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the Age';
                          }
                          return null;
                        },
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month),
                            border: OutlineInputBorder(),
                            labelText: 'Age'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the Address';
                          }
                          return null;
                        },
                        controller: addressController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.place),
                            border: OutlineInputBorder(),
                            labelText: 'Address'),
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the Phone number';
                          }
                          return null;
                        },
                        controller: phoneController,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: '+91 ',
                          prefixStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                          suffixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: 'Mobile',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 45),
                            backgroundColor:
                                const Color.fromARGB(255, 34, 128, 145),
                          ),
                          onPressed: () {
                            submitclick(nameController, ageController,
                                addressController, phoneController, formkey);
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.black,
                          ),
                          label: const Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }

  Future<void> submitclick(
    TextEditingController nameController,
    TextEditingController ageController,
    TextEditingController addressController,
    TextEditingController phoneController,
    GlobalKey<FormState> formkey,
  ) async {
    if (formkey.currentState!.validate()) {
      final CollectionReference firedata =
          FirebaseFirestore.instance.collection('studentdatas');
      final data = {
        'Name': nameController.text,
        'Age': ageController.text,
        'Address': addressController.text,
        'Phone': phoneController.text
      };
      await firedata.add(data);
      Get.back();
      Get.snackbar(
        "Success",
        "Student information submitted successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        overlayBlur: 1,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      );
    } else {
      Get.snackbar(
        "Error",
        "Please fill out all the fields",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        overlayBlur: 1,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      );
    }
  }
}
