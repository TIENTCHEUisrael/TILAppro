import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    final _with = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TextWidget(
              text: 'AP',
              color: AppColors.gradient1,
              size: 16,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: 'PRO',
              color: AppColors.white,
              size: 15,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
