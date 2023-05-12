import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

Widget cardWidget(
    {required String text, required IconData icon, required subtext}) {
  return Card(
    color: AppColors.greyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.all(40),
    elevation: 0.5,
    child: ListTile(
      leading: Icon(
        icon,
        color: AppColors.gradient1,
        size: 20,
      ),
      title: TextWidget(
        text: text,
        color: AppColors.black,
        size: 18,
      ),
      subtitle: TextWidget(
        text: subtext,
        color: AppColors.black,
        size: 15,
      ),
      trailing: const Icon(
        Icons.arrow_forward_rounded,
        color: AppColors.gradient1,
      ),
    ),
  );
}
