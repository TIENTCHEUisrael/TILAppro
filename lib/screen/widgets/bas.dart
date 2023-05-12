import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/colors.dart';

Widget bas() {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'AP',
          style: GoogleFonts.poppins(
            color: AppColors.navbarBackground,
          ),
        ),
        Text(
          'P',
          style: GoogleFonts.poppins(
            color: AppColors.gradient1,
          ),
        ),
        Text(
          'RO ',
          style: GoogleFonts.poppins(color: AppColors.black),
        ),
        Text(
          'version 1.0.0',
          style: GoogleFonts.poppins(),
        ),
      ],
    ),
  );
}
