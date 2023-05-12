import 'package:flutter/material.dart';
import 'package:tilappro/screen/components/dashboard/pages/Me/profile.dart';
import '../../../../../config/responsive.dart';
import '../../../../../models/user/user_model.dart';
import '../../../../../style/colors.dart';
import '../../../../../style/style.dart';
import '../../../../widgets/appbarWidget.dart';

class AccountPage extends StatefulWidget {
  final User user;
  const AccountPage({required this.user});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightbackground,
      appBar: AppBarWidget(
          icon: Icons.person_sharp, title: "Account", ctx: context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: Responsive.isMobile(context) ? 1 : 20,
            left: Responsive.isMobile(context) ? 1 : 30,
            right: Responsive.isMobile(context) ? 1 : 30,
            bottom: Responsive.isMobile(context) ? 1 : 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: MediaQuery.of(context).size.height / 1.1,
          width: MediaQuery.of(context).size.width / 1.1,
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/png/profile.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextWidget(
                        text: widget.user.name,
                        color: AppColors.black,
                        size: 14,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 0.3,
                  width: MediaQuery.of(context).size.width / 1.5,
                  color: AppColors.black,
                  margin: const EdgeInsets.only(bottom: 15),
                ),
                TabBar(
                  isScrollable: Responsive.isMobile(context) ? true : false,
                  indicatorColor: AppColors.gradient1,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            color: AppColors.black,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const TextWidget(
                              text: "Profile",
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
