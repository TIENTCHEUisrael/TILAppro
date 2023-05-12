import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../models/user/LogUser.dart';
import '../../services/providers/provider_user.dart';
import '../../style/colors.dart';
import '../../style/style.dart';
import '../widgets/delayedAnimation.dart';
import '../widgets/loginField.dart';
import '../widgets/snackbarwidget.dart';
import '../widgets/socialbutton.dart';
import 'dashboard/dashboardContent.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscuretext = true;
  final email = TextEditingController();
  final pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String filePath = "assets/images/json/log.json";
  bool isLoading = false;
  bool onhovered = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.text = 'admin@gmail.com';
    pass.text = 'admin';
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    //GoogleSignInProvider provider = Provider.of<GoogleSignInProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Lottie.asset(filePath, width: 400),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextWidget(
              text: 'Sign In.',
              size: 70,
            ),
            const SizedBox(
              height: 50,
            ),
            DelayedAnimation(
              delay: 380,
              child: SocialButton(
                iconPath: 'assets/images/svg/g_logo.svg',
                text: 'Sign In with Google',
                onPress: () {
                  print('Enter');
                  //provider.googleLogin();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextWidget(
              text: 'Or',
              size: 17,
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  DelayedAnimation(
                    delay: 400,
                    child: LoginField(
                      hintText: 'Enter your Email',
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your adress mail';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DelayedAnimation(
                    delay: 450,
                    child: LoginField(
                      hintText: 'Enter your password',
                      controller: pass,
                      obsureText: _obscuretext,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your pass';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MouseRegion(
                    onEnter: (value) {
                      setState(() {
                        onhovered = true;
                      });
                    },
                    onExit: (value) {
                      setState(() {
                        onhovered = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: onhovered ? 55 : 50,
                      width: onhovered ? 300 : 280,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gradient1,
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.white,
                              )
                            : const TextWidget(
                                text: 'Sign In',
                                color: AppColors.white,
                                size: 18,
                              ),
                        onPressed: () {
                          LogUser userlg = LogUser(
                            email: email.text,
                            password: pass.text,
                          );
                          final form = _formKey.currentState;
                          if (form!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            form.save();

                            var response = auth.loginUser(userlg);
                            response.then(
                              (respo) {
                                try {
                                  print('.........................');
                                  if (respo != null) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: CustomSnackBarContent(
                                          color: AppColors.greenColor,
                                          title: 'Message',
                                          content: 'User authenticate',
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.5,
                                      ),
                                    );

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) {
                                          return DashboardContent(user: respo);
                                        },
                                      ),
                                    );
                                    print(respo);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: CustomSnackBarContent(
                                          color: AppColors.redColor,
                                          title: 'Message',
                                          content: 'User not authenticated',
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.5,
                                      ),
                                    );
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: CustomSnackBarContent(
                                        color: AppColors.redColor,
                                        title: 'Message',
                                        content: 'User not authenticated',
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.5,
                                    ),
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
