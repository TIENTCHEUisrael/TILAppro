import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/responsive.dart';
import '../../style/colors.dart';

class LoginField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool obsureText;
  final Color? color;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  const LoginField(
      {this.hintText,
      this.color,
      required this.controller,
      this.obsureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: Responsive.isMobile(context)
          ? const BoxConstraints(
              maxWidth: 350,
            )
          : const BoxConstraints(
              maxWidth: 400,
            ),
      child: TextFormField(
        controller: controller,
        obscureText: obsureText,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(color: color),
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.textBorderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.gradient1,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: suffixIcon,
          ),
          prefixIcon: prefixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
