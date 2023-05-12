import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/responsive.dart';
import '../../style/colors.dart';
import '../../style/style.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final Function()? onPress;
  const SocialButton(
      {required this.iconPath, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: AppColors.white,
      ),
      label: TextWidget(
        text: text,
        color: AppColors.white,
        size: 17,
      ),
      style: Responsive.isMobile(context)
          ? TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 30,
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.textBorderColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            )
          : TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 100,
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.textBorderColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
    );
  }
}

class SocialButton2 extends StatelessWidget {
  final Function()? onpress;
  final Icon icon;
  final Widget widget;
  SocialButton2(
      {required this.onpress, required this.icon, required this.widget});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton.icon(
      onPressed: onpress,
      icon: icon,
      label: widget,
      style: ElevatedButton.styleFrom(
        primary: AppColors.white,
        onPrimary: AppColors.black,
        minimumSize: Size(
          double.infinity,
          50,
        ),
      ),
    );
  }
}
