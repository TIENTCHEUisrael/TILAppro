import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

class CustomSnackBarContent extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  const CustomSnackBarContent(
      {required this.title, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(18),
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "${title}",
                      color: AppColors.white,
                    ),
                    const Spacer(),
                    TextWidget(
                      text: "Error: ${content}",
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close_rounded,
                  size: 40,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
