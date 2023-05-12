import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilappro/screen/widgets/profileuser.dart';

import '../../config/responsive.dart';
import '../../services/providers/provider_user.dart';
import '../../style/colors.dart';
import '../../style/style.dart';
import '../components/loginScreen.dart';

AppBar AppBarWidget({
  required IconData icon,
  required String title,
  required BuildContext ctx,
}) {
  AuthProvider authProvider = Provider.of<AuthProvider>(ctx);
  return Responsive.isMobile(ctx)
      ? AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        )
      : AppBar(
          title: TextWidget(
            text: title,
          ),
          elevation: 0.2,
          leading: Icon(icon),
          actions: [
            Row(
              children: [
                ProfileUser(user: authProvider.user),
                const TextWidget(
                  text: "Logout",
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      ctx,
                      MaterialPageRoute(
                        builder: (_) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.redColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        );
}
