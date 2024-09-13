import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../controllers/student_details.controller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../model/student_model.dart';

class StudentDetailspage extends StatelessWidget {
  final StudentDetailsController controller =
      Get.put(StudentDetailsController());
  final Student student;

  StudentDetailspage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Student Profile', style: titletxt),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controller.showCustomDialog(student);
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              controller.editStudent(student);
            },
          ),
        ],
        backgroundColor: Tcolors.primarycolor1,
      ),
      body: ListView(
        children: [
          kheight,
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(File(student.profilePicture))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kheight,
                  Text(
                    'Name :   ${student.name}',
                    style: contenttxt,
                  ),
                  kheight,
                  Text(
                    'Schoolname :   ${student.schoolname}',
                    style: contenttxt,
                  ),
                  kheight,
                  Text(
                    'Fathername :    ${student.fathername}',
                    style: contenttxt,
                  ),
                  kheight,
                  Text(
                    'Age :                   ${student.age}',
                    style: contenttxt,
                  ),
                  kheight,
                  const SizedBox(
                    width: 63,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
