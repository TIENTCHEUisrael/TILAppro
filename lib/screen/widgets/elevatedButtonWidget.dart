import 'package:flutter/material.dart';

import '../../config/responsive.dart';
import '../../style/colors.dart';
import '../../style/style.dart';

class ButtonElevatedWidget extends StatelessWidget {
  final void Function()? onPressed;
  const ButtonElevatedWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          AppColors.gradient1,
          Colors.blue,
          AppColors.gradient1,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Responsive.isMobile(context)
              ? const Size(330, 55)
              : const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: TextWidget(
          text: 'Sign In',
          fontWeight: FontWeight.w600,
          size: 17,
        ),
      ),
    );
  }
}
