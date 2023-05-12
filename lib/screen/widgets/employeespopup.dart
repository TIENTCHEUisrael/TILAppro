import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tilappro/screen/widgets/snackbarwidget.dart';

import '../../models/user/user_model.dart';
import '../../services/providers/provider_user.dart';
import '../../style/colors.dart';
import '../../style/style.dart';
import 'custum.dart';
import 'delayedAnimation.dart';
import 'head.dart';

const String heroadduser = 'add-todo-invest';

class AddUserPop extends StatefulWidget {
  const AddUserPop();

  @override
  State<AddUserPop> createState() => _AddUserPopupState();
}

class _AddUserPopupState extends State<AddUserPop> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    bool _isLoading = false;
    final password = TextEditingController();
    final name = TextEditingController();
    final email = TextEditingController();
    final role = TextEditingController();

    bool _obscuretext = true;
    final _formKey = GlobalKey<FormState>();
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50.0),
        child: Hero(
          tag: "heroaddposte",
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: StatefulBuilder(builder: (context, set) {
            return AlertDialog(
              backgroundColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              content: SingleChildScrollView(
                padding: const EdgeInsets.all(
                  30,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: const Icon(
                              Icons.add_business,
                              color: AppColors.gradient1,
                              size: 60,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: const TextWidget(
                              text: 'Ajouter un Employé',
                              color: AppColors.black,
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          DelayedAnimation(
                            delay: 150,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                controller: name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '',
                                  label: TextWidget(
                                    text: 'Name',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.edit_note,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer le Name ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DelayedAnimation(
                            delay: 250,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                obscureText: _obscuretext,
                                keyboardType: TextInputType.number,
                                controller: password,
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  label: TextWidget(
                                    text: 'Password',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.visibility,
                                      color: AppColors.textBorderColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscuretext = !_obscuretext;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer le Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DelayedAnimation(
                            delay: 300,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                controller: email,
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      color: AppColors.textBorderColor),
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '',
                                  label: TextWidget(
                                    text: 'Email',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.email,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer l\'Email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DelayedAnimation(
                            delay: 300,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 350,
                              ),
                              child: TextFormField(
                                controller: role,
                                style: GoogleFonts.poppins(
                                  color: AppColors.gradient1,
                                ),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      color: AppColors.textBorderColor),
                                  contentPadding: const EdgeInsets.all(27),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.textBorderColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: AppColors.gradient1,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '',
                                  label: TextWidget(
                                    text: 'Role',
                                    color: AppColors.black,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.functions,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrer le role';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.gradient1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 20,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              User userlg = User(
                                name: name.text,
                                password: password.text,
                                email: email.text,
                                role: role.text,
                                createdAt: DateTime.now().toString(),
                              );
                              final form = _formKey.currentState;
                              if (form!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                form.save();

                                var response = authProvider.saveUser(userlg);
                                response.then(
                                  (respo) {
                                    try {
                                      print('.........................');
                                      if (respo != null) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: CustomSnackBarContent(
                                              color: AppColors.greenColor,
                                              title: 'Message',
                                              content: 'User Saved',
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0.5,
                                          ),
                                        );

                                        Navigator.pop(context);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: CustomSnackBarContent(
                                              color: AppColors.redColor,
                                              title: 'Message',
                                              content: 'User not saved',
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0.5,
                                          ),
                                        );
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: CustomSnackBarContent(
                                            color: AppColors.redColor,
                                            title: 'Message',
                                            content: 'User not savec',
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.5,
                                        ),
                                      );
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                );
                              }
                            },
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 1,
                                  )
                                : TextWidget(
                                    text: 'Add',
                                    color: AppColors.white,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

const String heroemployees = 'add-todo-employe';

class UserPopup extends StatefulWidget {
  final User user;
  UserPopup({required this.user});

  @override
  State<UserPopup> createState() => _UserPopupState();
}

class _UserPopupState extends State<UserPopup> {
  bool horeved = false;
  bool horeved2 = false;
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    bool _isLoading = false;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(100.0),
        child: Hero(
          tag: heroemployees,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    headContent(
                      title: "Employees",
                      subtitle: "",
                      icondata: Icons.person,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 280),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.person,
                            color: AppColors.gradient1,
                            size: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: 'Information du User',
                            fontWeight: FontWeight.bold,
                            size: 25,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Nom du User:',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: '${authProvider.user.name}',
                            fontWeight: FontWeight.bold,
                            size: 25,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 400, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: 'Email de User:',
                            color: AppColors.black,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: '${authProvider.user.email} ',
                            fontWeight: FontWeight.bold,
                            size: 25,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          text: "OK",
                          color: AppColors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
