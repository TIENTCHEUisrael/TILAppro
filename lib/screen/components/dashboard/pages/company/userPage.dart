import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tilappro/screen/components/dashboard/pages/company/userModif.dart';
import 'package:tilappro/screen/widgets/snackbarwidget.dart';

import '../../../../../models/user/user_model.dart';
import '../../../../../services/providers/provider_user.dart';
import '../../../../../style/colors.dart';
import '../../../../../style/style.dart';
import '../../../../widgets/appbarWidget.dart';
import '../../../../widgets/custum.dart';
import '../../../../widgets/employeespopup.dart';
import '../../../../widgets/head.dart';

class EmployePage extends StatefulWidget {
  final User user;
  const EmployePage({required this.user});

  @override
  State<EmployePage> createState() => _EmployePageState();
}

class _EmployePageState extends State<EmployePage> {
  List<User>? _users;
  bool _isLoading = true;
  bool load = false;
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Future<void> getUsers() async {
    await AuthProvider.getUsers().then((value) => {
          if (value.isNotEmpty)
            {
              setState(() {
                _users = value;
                _isLoading = false;
              })
            }
          else if (value == [])
            {
              setState(() {
                _isLoading = false;
              })
            }
        });
  }

  bool hoveredButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightbackground,
      appBar: AppBarWidget(
          icon: Icons.person_search_rounded, title: "Users", ctx: context),
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
          height: MediaQuery.of(context).size.height / 1.1,
          width: MediaQuery.of(context).size.width / 1.1,
          child: widget.user.role == "admin"
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      headContent(
                        title: "Users ",
                        subtitle: "Company employees Managment",
                        icondata: Icons.person_search,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(children: [
                          const TextWidget(
                            text: 'Ajouter un Employe',
                            color: AppColors.black,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Hero(
                            tag: "heroemployees",
                            createRectTween: (begin, end) {
                              return CustomRectTween(begin: begin!, end: end!);
                            },
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.gradient1,
                                padding: const EdgeInsets.all(10),
                                minimumSize: hoveredButton
                                    ? const Size(205, 55)
                                    : const Size(200, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              onHover: (value) {
                                setState(() {
                                  hoveredButton = true;
                                });
                              },
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AddUserPop();
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: AppColors.white,
                                size: 18,
                              ),
                              label: const TextWidget(
                                text: 'Ajouter un Employe',
                                fontWeight: FontWeight.bold,
                                size: 18,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Column(
                            children: [
                              TextWidget(
                                text: 'Listes des et employés de l\'Entreprise',
                                color: AppColors.black,
                                size: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 1,
                                width: MediaQuery.of(context).size.width / 8,
                                color: AppColors.gradient1,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: AppColors.textBorderColor, width: 0.5),
                              bottom: BorderSide(
                                  color: AppColors.textBorderColor,
                                  width: 0.5)),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            side: BorderSide(
                              width: 1,
                              color: AppColors.textBorderColor,
                            ),
                          ),
                          leading: Icon(
                            Icons.person,
                            color: AppColors.gradient1,
                            size: 50,
                          ),
                          title: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                TextWidget(
                                  text: 'Username',
                                  size: 20,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextWidget(
                                  text: 'Email',
                                  size: 20,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextWidget(
                                  text: 'Password',
                                  size: 20,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextWidget(
                                  text: 'Function',
                                  size: 20,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            padding: const EdgeInsets.only(left: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    color: AppColors.black, width: 1),
                              ),
                            ),
                            child: const TextWidget(
                              text: 'Actions',
                              color: AppColors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width - 100,
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.gradient1,
                                  strokeWidth: 2,
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  return listCard(_users![index], context);
                                },
                                itemCount: _users!.length,
                              ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: SizedBox(
                    child: TextWidget(
                      text: "Vous etes pas Administrator!",
                      size: 40,
                      color: AppColors.black,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget listCard(User user, BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Card(
      color: AppColors.white,
      elevation: 2,
      child: ListTile(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                "assets/images/png/profile.png",
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(left: 60, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      child: Expanded(
                        child: TextWidget(
                          text: user.name,
                          size: 20,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    Container(
                      width: 200,
                      child: Expanded(
                        child: TextWidget(
                          text: user.email,
                          size: 20,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 70),
                      width: 300,
                      child: Expanded(
                        child: TextWidget(
                          text: user.password,
                          size: 20,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Container(
                      width: 150,
                      child: Expanded(
                        child: TextWidget(
                          text: user.role,
                          size: 20,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return EmployeInfoPage(
                            user: user,
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.textBorderColor,
                      size: 30,
                    ),
                    mouseCursor: SystemMouseCursors.click,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  user.role == "admin"
                      ? Container()
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              load = true;
                            });
                            final response = authProvider.deleteUser(
                              user,
                            );
                            response.then((value) {
                              if (value['statut']) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: CustomSnackBarContent(
                                      color: AppColors.greenColor,
                                      title: '',
                                      content: value['message'].toString(),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.5,
                                  ),
                                );
                                setState(() {
                                  load = false;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: CustomSnackBarContent(
                                      color: AppColors.greenColor,
                                      title: '',
                                      content: value['message'].toString(),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.5,
                                  ),
                                );
                              }
                            });
                          },
                          icon: load
                              ? const CircularProgressIndicator(
                                  color: AppColors.gradient1,
                                )
                              : const Icon(
                                  Icons.delete,
                                  color: AppColors.redColor,
                                  size: 30,
                                ),
                          mouseCursor: SystemMouseCursors.click,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
