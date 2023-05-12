import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32),
      child: Row(
        children: [
          TextWidget(
            text: 'All',
            size: 12,
            color: AppColors.black,
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 25,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextWidget(
                text: 'Current',
                size: 12,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          // TextWidget(
          //   text: 'Pending',
          //   size: 12,
          //   color: AppColors.black,
          // ),
          // SizedBox(
          //   width: 15,
          // ),
          // TextWidget(
          //   text: 'Pending',
          //   size: 12,
          //   color: AppColors.black,
          // ),
        ],
      ),
    );
  }
}
