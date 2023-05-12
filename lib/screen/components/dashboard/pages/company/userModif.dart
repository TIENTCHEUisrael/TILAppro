import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../models/user/user_model.dart';
import '../../../../../services/providers/provider_user.dart';
import '../../../../../style/colors.dart';
import '../../../../../style/style.dart';
import '../../../../widgets/custum.dart';
import '../../../../widgets/delayedAnimation.dart';
import '../../../../widgets/snackbarwidget.dart';

class EmployeInfoPage extends StatefulWidget {
  final User user;
  const EmployeInfoPage({required this.user});

  @override
  State<EmployeInfoPage> createState() => _EmployeInfoPageState();
}

class _EmployeInfoPageState extends State<EmployeInfoPage> {
  bool _isloading = true;
  bool _isloading2 = true;
  bool horeved1 = false;
  bool horeved2 = true;
  Color color1 = AppColors.textBorderColor;
  Color color2 = AppColors.textBorderColor;

  final password = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final role = TextEditingController();

  @override
  void initState() {
    password.text = widget.user.password;
    name.text = widget.user.name;
    email.text = widget.user.email;
    role.text = widget.user.role;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    bool _isLoading = false;

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
                child: _isloading
                    ? Center(
                        child: const CircularProgressIndicator(
                          color: AppColors.gradient1,
                        ),
                      )
                    : Column(
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: const TextWidget(
                                    text: 'Ajouter un User',
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
                                        contentPadding:
                                            const EdgeInsets.all(27),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.textBorderColor,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.gradient1,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: '',
                                        label: TextWidget(
                                          text: 'Name',
                                          color: AppColors.black,
                                        ),
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
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
                                        contentPadding:
                                            const EdgeInsets.all(27),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.textBorderColor,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.gradient1,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        contentPadding:
                                            const EdgeInsets.all(27),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.textBorderColor,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.gradient1,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: '',
                                        label: TextWidget(
                                          text: 'Email',
                                          color: AppColors.black,
                                        ),
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
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
                                        contentPadding:
                                            const EdgeInsets.all(27),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.textBorderColor,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: AppColors.gradient1,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: '',
                                        label: TextWidget(
                                          text: 'Role',
                                          color: AppColors.black,
                                        ),
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.email,
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
                                      idUser: widget.user.idUser,
                                      name: name.text,
                                      password: widget.user.password,
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

                                      var response =
                                          authProvider.updateUser(userlg);
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
                                                  content:
                                                      CustomSnackBarContent(
                                                    color: AppColors.greenColor,
                                                    title: 'Message',
                                                    content: 'User Updated',
                                                  ),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0.5,
                                                ),
                                              );

                                              Navigator.pop(context);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      CustomSnackBarContent(
                                                    color: AppColors.redColor,
                                                    title: 'Message',
                                                    content: 'User not Updated',
                                                  ),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
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
                                                  content: 'User not updated',
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                          text: 'Updated',
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
