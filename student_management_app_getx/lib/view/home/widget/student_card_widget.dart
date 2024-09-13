import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/core/colors.dart';

import '../../../controllers/home_page_controller.dart';
import '../../../model/student_model.dart';
import '../../student_details/students_details_page.dart';

class StudentCardWidget extends StatelessWidget {
  const StudentCardWidget({
    super.key,
    required this.student,
    required this.controller,
  });

  final Student student;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(StudentDetailspage(student: student))?.then(
            (value) => controller.refreshStudentList());
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,backgroundColor: Tcolors.primarycolor1,
            backgroundImage:
                FileImage(File(student.profilePicture)),
          ),
          title: Text(
            student.name,
            style: GoogleFonts.roboto(color: Tcolors.black,fontSize: 18,fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(student.schoolname,style: GoogleFonts.roboto(fontSize: 16),),
              Text('age:${student.age.toString()}',style: GoogleFonts.roboto(fontSize: 16),),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded)
        ),
      ),
    );
  }
}