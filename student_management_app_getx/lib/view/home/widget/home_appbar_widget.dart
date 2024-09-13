import 'package:flutter/material.dart';

import '../../../controllers/home_page_controller.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Tcolors.primarycolor1,
            Tcolors.primarycolor2,
            Tcolors.primarycolor3,
            Tcolors.primarycolor4,
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Student List ',
            style: titletxt,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Tcolors.white),
              onChanged: (query) {
                controller.filterStudents(query);
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Tcolors.white,
                      )),
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Tcolors.white,
                  ),
                  hintText: 'search students',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintStyle: TextStyle(
                    color: Tcolors.white,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
