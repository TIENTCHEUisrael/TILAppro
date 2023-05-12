import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget? smallMobile;

  const Responsive(
      {required this.mobile,
      this.tablet,
      required this.desktop,
      this.smallMobile});

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 750;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 750;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1200 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1200 and more then 768 we consider it as tablet
    else if (_size.width >= 750 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else if (_size.width >= 350 && _size.width <= 750 && mobile != null) {
      return mobile;
    } else {
      return smallMobile!;
    }
  }
}
