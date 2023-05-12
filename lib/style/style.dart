import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class TextWidget extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String? text;
  final double height;

  const TextWidget({
    this.text,
    this.fontWeight: FontWeight.w400,
    this.color: Colors.white,
    this.size: 20,
    this.height: 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}
