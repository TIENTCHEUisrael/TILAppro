import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import '../../style/colors.dart';
import '../../style/style.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String filePath = "assets/images/json/e.json";
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then(
      (value) => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (_) {
            return LoginScreen();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(filePath, width: 400),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextWidget(
                  text: 'AP',
                  color: AppColors.gradient1,
                  size: 80,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  text: 'PRO',
                  color: AppColors.white,
                  size: 80,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
