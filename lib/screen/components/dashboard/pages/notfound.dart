import 'package:flutter/material.dart';

import '../../../../models/user/user_model.dart';
import '../../../../style/colors.dart';
import '../../../../style/style.dart';
import '../../../widgets/appbarWidget.dart';

class NotFoundPage extends StatefulWidget {
  final User user;
  const NotFoundPage({required this.user});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightbackground,
      appBar:
          AppBarWidget(icon: Icons.settings, title: "NotFound", ctx: context),
      body: const Center(
        child: SizedBox(
          child: TextWidget(
            text: "NOT FOUND Page",
            size: 40,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
