import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/core/constants.dart';

import '../../controllers/add_students_controller.dart';
import '../../core/colors.dart';
import '../../data_base_helper/data_base_helper.dart';
import '../../model/student_model.dart';
import '../widgets/round_button.dart';

// ignore: must_be_immutable
class AddStudentScreen extends StatelessWidget {
  final AddStudentController controller = Get.put(AddStudentController());
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _schoolnameController = TextEditingController();
  final _fathernameController = TextEditingController();

  DatabaseHelper databaseHelper = DatabaseHelper();

  AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Tcolors.white,
        title: Text(
          "Add Student",
          style: GoogleFonts.roboto(fontSize: 20),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                Tcolors.primarycolor1,
                Tcolors.primarycolor2,
                Tcolors.primarycolor3,
                Tcolors.primarycolor4
              ])),
        ),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            kheight20,
            GestureDetector(
                onTap: () async {
                  XFile? img = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  controller.updateProfilePicturePath(img!.path);
                },
                child: Obx(
                  () => CircleAvatar(
                    radius: 80,
                    backgroundColor: Tcolors.primarycolor1,
                    backgroundImage: controller
                            .profilePicturePath.value.isNotEmpty
                        ? FileImage(File(controller.profilePicturePath.value))
                        : null,
                    child: controller.profilePicturePath.value.isEmpty
                        ? Icon(
                            Icons.add_a_photo,
                            color: Tcolors.white,
                            size: 35,
                          )
                        : null,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  kheight20,
                  TextFormField(
                    controller: _nameController,
                    onChanged: controller.updateName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Student Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Student Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight17,
                  TextFormField(
                    controller: _schoolnameController,
                    onChanged: controller.updateSchoolName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text(' School Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter The school Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight17,
                  TextFormField(
                    controller: _fathernameController,
                    onChanged: controller.updateFatherName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Father Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Father Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kheight17,
                  TextFormField(
                    controller: _ageController,
                    onChanged: (value) => controller.updateAge(value),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Age'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Age';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  kheight40,
                  SizedBox(
                    width: size.width,
                    child: Center(
                      child: RoundButton(
                        title: 'Save',
                        textColor: Tcolors.white,
                        buttonColor: Tcolors.primarycolor2,
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            final name = controller.name.value;
                            final school = controller.schoolName.value;
                            final father = controller.fatherName.value;
                            final age = controller.age.value;

                            final student = Student(
                              id: 0,
                              name: name,
                              schoolname: school,
                              fathername: father,
                              age: age,
                              profilePicture:
                                  controller.profilePicturePath.value,
                            );
                            controller.clearImage();
                            databaseHelper.insertStudent(student).then((id) {
                              if (id > 0) {
                                Get.back();

                                controller.saveStudent();
                              } else {
                                Get.snackbar(
                                  'Failed',
                                  'Failed to add student',
                                  backgroundColor: Colors.red,
                                  snackPosition: SnackPosition.TOP,
                                  colorText: Colors.white,
                                  duration: const Duration(seconds: 3),
                                );
                              }
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  kheight40,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
