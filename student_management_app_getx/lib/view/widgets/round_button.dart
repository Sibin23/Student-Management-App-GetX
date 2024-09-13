import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/core/constants.dart';

import '../../core/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Tcolors.primarycolor1,
                  Tcolors.primarycolor2,
                  Tcolors.primarycolor3,
                  Tcolors.primarycolor4,
                ]),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(5, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.save,
              color: Tcolors.white,
            ),
            w10,
            Text(
              'Save',
              style: GoogleFonts.roboto(color: Tcolors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
