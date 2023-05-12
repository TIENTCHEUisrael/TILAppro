import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/responsive.dart';
import '../../../../models/user/user_model.dart';
import '../../../../services/providers/provider_user.dart';
import '../../../../style/colors.dart';
import '../../../../style/style.dart';
import '../../../widgets/appbarWidget.dart';
import '../../../widgets/employeeContent.dart';
import '../../../widgets/sharedFileItems.dart';
import '../../../widgets/subHeader.dart';
import '../../../widgets/tabs.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User>? _users;
  bool _isloading = true;
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Future<void> getUsers() async {
    print('---------------------------------------');
    await AuthProvider.getUsers().then((value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                _users = value;
              })
            }
          else if (value == [])
            {
              setState(() {
                _isloading = false;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightbackground,
      appBar:
          AppBarWidget(icon: Icons.dashboard, title: "Dashboard", ctx: context),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 30,
            right: 30,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: size.height / 1.1,
          width: size.width / 1.1,
          child: SingleChildScrollView(
            child: widget.user.role == "admin"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 30, top: 25, bottom: 10),
                        child: const TextWidget(
                          text: 'Employees Managment',
                          color: AppColors.gradient1,
                          fontWeight: FontWeight.bold,
                          size: 20,
                        ),
                      ),
                      Tabs(),
                      _isloading
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 25),
                              height: 260,
                              width: MediaQuery.of(context).size.width / 0.5,
                              child: Row(
                                mainAxisAlignment: Responsive.isDesktop(context)
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  EmployeeCardContent(
                                    emprunts: 3,
                                    color: Color(0xFFFF4C60),
                                    progressIndicatorColor:
                                        Colors.redAccent[100]!,
                                    projectName: 'Stocks',
                                    percentComplete: '74%',
                                    icon: Icons.featured_video_sharp,
                                  ),
                                  EmployeeCardContent(
                                    emprunts: 3,
                                    color: Color(0xFFFF4C60),
                                    progressIndicatorColor:
                                        Colors.redAccent[100]!,
                                    projectName: 'Users',
                                    percentComplete: '24%',
                                    icon: Icons.featured_video_sharp,
                                  ),
                                  EmployeeCardContent(
                                    emprunts: 3,
                                    color: Color(0xFFFF4C60),
                                    progressIndicatorColor:
                                        Colors.redAccent[100]!,
                                    projectName: 'Commandes',
                                    percentComplete: '34%',
                                    icon: Icons.featured_video_sharp,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.symmetric(vertical: 25),
                              height: 260,
                              width: MediaQuery.of(context).size.width / 0.5,
                              child: Row(
                                mainAxisAlignment: Responsive.isDesktop(context)
                                    ? MainAxisAlignment.spaceEvenly
                                    : MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  EmployeeCardContent(
                                    emprunts: _users!.length,
                                    color: Color(0xFFFF4C60),
                                    progressIndicatorColor:
                                        Colors.redAccent[100]!,
                                    projectName: 'Employees',
                                    percentComplete: '74%',
                                    icon: Icons.featured_video_sharp,
                                  ),
                                ],
                              ),
                            ),
                      const SubHeader(
                        title: 'Fournisseurs',
                      ),
                      SharedFilesItems(
                        sharedFileName:
                            'Société Anonyme des Brasseries du Cameroun: SABC Company',
                        color: AppColors.redColor,
                        members: '10 produits',
                        et: '10 Oct 2019',
                        filesize: '2.3%',
                      ),
                      SharedFilesItems(
                        sharedFileName:
                            'Societe Nationale de Raffinange : SONARA Company',
                        color: AppColors.gradient1,
                        members: '14 produits',
                        et: '08 Oct 2019',
                        filesize: '1.6%',
                      ),
                      SharedFilesItems(
                        sharedFileName: 'Societe de Plantation SPHP Company',
                        color: AppColors.greenColor,
                        members: '30 produits',
                        et: '27 Oct 2019',
                        filesize: '4.2%',
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          "assets/images/json/welcome.json",
                          height: 700,
                        ),
                        TextWidget(
                          color: AppColors.black,
                          text: "Welcome Mister " + widget.user.name + " !",
                          size: 35,
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
