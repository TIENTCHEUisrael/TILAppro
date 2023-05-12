import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';
import '../../style/colors.dart';
import '../../style/style.dart';

ProfileUser({required User user}) {
  return Container(
    margin: const EdgeInsets.only(right: 30),
    child: Row(
      children: [
        CircleAvatar(
          child: ClipOval(
              child: /*user.photo == "null"
                ? */
                  Image.asset(
            "assets/images/png/profile.png",
            width: 100,
            height: 100,
          )
              // : Image.network(
              //     user.photo,
              //     width: 100,
              //     height: 100,
              //     errorBuilder: (context, error, stackTrace) {
              //       return Image.asset('assets/images/png/profile.png',
              //           width: 100, height: 100, fit: BoxFit.cover);
              //     },
              //   ),
              ),
        ),
        const SizedBox(
          width: 5,
        ),
        TextWidget(
          text: "Hi, ${user.name}!",
          color: AppColors.white,
          size: 14,
        ),
      ],
    ),
  );
}
