import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

Widget headContent(
    {required String title,
    required String subtitle,
    required IconData icondata}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icondata,
          color: AppColors.gradient1,
          size: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        TextWidget(
          text: title,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
        ),
        TextWidget(
          text: subtitle,
          color: AppColors.textBorderColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: AppColors.gradient1,
          width: 50,
          height: 2,
        ),
      ],
    ),
  );
}
