import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../style/colors.dart';
import 'companyName.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key, required SidebarXController controller})
      : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        decoration: const BoxDecoration(
          color: AppColors.navbarBackground,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
        ),
        itemMargin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        itemPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        selectedTextStyle: GoogleFonts.poppins(
          color: AppColors.gradient1,
          fontSize: 17,
        ),
        textStyle: GoogleFonts.poppins(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        selectedIconTheme: const IconThemeData(
          opacity: 30,
          color: AppColors.gradient1,
          size: 30,
        ),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      headerBuilder: (context, extended) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/images/json/logo.json", height: 150),
              const SizedBox(
                height: 10,
              ),
              CompanyName(),
            ],
          ),
        );
      },
      footerDivider: const Divider(
        color: AppColors.textBorderColor,
        height: 0.5,
      ),
      headerDivider: const Divider(
        color: AppColors.textBorderColor,
        height: 0.5,
      ),
      animationDuration: Duration(microseconds: 3),
      items: const [
        SidebarXItem(
          icon: Icons.dashboard,
          label: "  Dashboard",
        ),
        SidebarXItem(
          icon: Icons.person_sharp,
          label: "  Account",
        ),
        SidebarXItem(
          icon: Icons.person_search_rounded,
          label: "  User",
        ),
        SidebarXItem(
          icon: Icons.list_alt_outlined,
          label: "  Collection",
        ),
      ],
    );
  }
}
