import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management_getx/view/home/widget/student_card_widget.dart';

import '../../controllers/home_page_controller.dart';
import '../../core/colors.dart';
import '../add_student/add_students.dart';
import 'widget/home_appbar_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: HomeAppbarWidget(controller: controller),
      ),
      body: Obx(() {
        return controller.filteredStudents.isEmpty
            ? Center(
                child: SizedBox(
                    width: 300,
                    child: Lottie.asset('assets/no data found.json')),
              )
            : ListView.builder(
              itemCount: controller.filteredStudents.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final student = controller.filteredStudents[index];
                return index % 2 == 0
                    ? FadeInLeft(
                        duration: const Duration(milliseconds: 1600),
                        child: StudentCardWidget(
                            student: student, controller: controller))
                    : FadeInRight(
                        duration: const Duration(milliseconds: 1600),
                        child: StudentCardWidget(
                            student: student, controller: controller));
              },
            );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddStudentScreen())!
              .then((value) => controller.refreshStudentList());
        },
        backgroundColor: Tcolors.primarycolor4,
        child:  Icon(Icons.add, color: Tcolors.white),
      ),
    );
  }
}
