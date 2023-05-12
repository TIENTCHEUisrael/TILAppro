import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

class SubHeader extends StatelessWidget {
  final String title;
  const SubHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: title,
            size: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          const TextWidget(
            text: "View All",
            size: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
