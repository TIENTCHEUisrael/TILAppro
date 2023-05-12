import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/responsive.dart';
import '../../../../../models/user/user_model.dart';
import '../../../../../services/providers/provider_user.dart';
import '../../../../../style/colors.dart';
import '../../../../../style/style.dart';
import '../../../../widgets/delayedAnimation.dart';
import '../../../../widgets/snackbarwidget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _roleController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  bool hovered = false;
  bool isloading = false;

  @override
  void dispose() {
    _roleController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Responsive.isMobile(context)
                  ? Column(
                      children: [
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person,
                                color: AppColors.gradient1,
                                size: 100,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const TextWidget(
                                text: 'Work Information',
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const TextWidget(
                                text: 'Basic Information about your Role',
                                color: AppColors.textBorderColor,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: AppColors.gradient1,
                                width: 50,
                                height: 2,
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.greyColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.containergreyColor,
                                  ),
                                  height: 150,
                                  width: 150,
                                  child: InkWell(
                                    onTap: () async {
                                      print('tap');
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 45,
                                        color: AppColors.gradient1,
                                      ),
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        child: TextWidget(
                                          text: authProvider.user.name,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      DelayedAnimation(
                                        delay: 100,
                                        child: Container(
                                          color: AppColors.white,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 45, vertical: 15),
                                          child: TextFormField(
                                            controller: _roleController,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            decoration: InputDecoration(
                                              focusColor: Colors.white,
                                              //add prefix icon
                                              prefixIcon: Icon(
                                                Icons.rule,
                                                color: Colors.grey,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),

                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: AppColors.gradient1,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              fillColor: Colors.grey,

                                              hintText: authProvider.user.role,

                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),

                                              labelText: 'Roles',
                                              //lable style
                                              labelStyle: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DelayedAnimation(
                                        delay: 100,
                                        child: Container(
                                          color: AppColors.white,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 45, vertical: 15),
                                          child: TextFormField(
                                            controller: _emailController,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            decoration: InputDecoration(
                                              focusColor: Colors.white,
                                              //add prefix icon
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: Colors.grey,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),

                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: AppColors.gradient1,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              fillColor: Colors.grey,

                                              hintText: "Email",

                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),

                                              labelText: 'Email',
                                              //lable style
                                              labelStyle: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DelayedAnimation(
                                        delay: 100,
                                        child: Container(
                                          color: AppColors.white,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 45, vertical: 15),
                                          child: TextFormField(
                                            controller: _emailController,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            decoration: InputDecoration(
                                              focusColor: Colors.white,
                                              //add prefix icon
                                              prefixIcon: Icon(
                                                Icons.edit,
                                                color: Colors.grey,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),

                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: AppColors.gradient1,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              fillColor: Colors.grey,

                                              hintText: "Name",

                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),

                                              labelText: 'Name',
                                              //lable style
                                              labelStyle: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.person,
                              color: AppColors.gradient1,
                              size: 100,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextWidget(
                              text: 'Work Information',
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextWidget(
                              text: 'Basic Information about your Role',
                              color: AppColors.textBorderColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: AppColors.gradient1,
                              width: 50,
                              height: 2,
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.greyColor,
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.containergreyColor,
                                ),
                                height: 150,
                                width: 150,
                                child: InkWell(
                                  onTap: () async {
                                    print('tap');
                                  },
                                  mouseCursor: SystemMouseCursors.click,
                                  child: Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 45,
                                      color: AppColors.gradient1,
                                    ),
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: TextWidget(
                                        text: authProvider.user.name,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    DelayedAnimation(
                                      delay: 100,
                                      child: Container(
                                        color: AppColors.white,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 45, vertical: 15),
                                        child: TextFormField(
                                          controller: _roleController,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: InputDecoration(
                                            focusColor: Colors.white,
                                            //add prefix icon
                                            prefixIcon: Icon(
                                              Icons.rule,
                                              color: Colors.grey,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.gradient1,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            fillColor: Colors.grey,

                                            hintText: authProvider.user.role,

                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),

                                            labelText: 'Roles',
                                            //lable style
                                            labelStyle: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DelayedAnimation(
                                      delay: 150,
                                      child: Container(
                                        color: AppColors.white,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 45, vertical: 15),
                                        child: TextFormField(
                                          controller: _emailController,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: InputDecoration(
                                            focusColor: Colors.white,
                                            //add prefix icon
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Colors.grey,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.gradient1,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            fillColor: Colors.grey,

                                            hintText: authProvider.user.email,

                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),

                                            labelText: 'Email',
                                            //lable style
                                            labelStyle: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DelayedAnimation(
                                      delay: 100,
                                      child: Container(
                                        color: AppColors.white,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 45, vertical: 15),
                                        child: TextFormField(
                                          controller: _emailController,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          decoration: InputDecoration(
                                            focusColor: Colors.white,
                                            //add prefix icon
                                            prefixIcon: Icon(
                                              Icons.edit,
                                              color: Colors.grey,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.gradient1,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            fillColor: Colors.grey,

                                            hintText: authProvider.user.name,

                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),

                                            labelText: 'Name',
                                            //lable style
                                            labelStyle: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    MouseRegion(
                                      onEnter: (value) {
                                        setState(() {
                                          hovered = true;
                                        });
                                      },
                                      onExit: (value) {
                                        setState(() {
                                          hovered = true;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(microseconds: 100),
                                        margin: const EdgeInsets.only(top: 20),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            print(
                                                '------------${'${_emailController.text} ${_roleController.text}'}----------');
                                            User us = User(
                                              idUser: authProvider.user.idUser,
                                              name: _nameController.text,
                                              password:
                                                  authProvider.user.password,
                                              email: _emailController.text,
                                              role: authProvider.user.role,
                                              createdAt:
                                                  DateTime.now().toString(),
                                            );
                                            final form = _formKey.currentState;
                                            if (form!.validate()) {
                                              setState(() {
                                                isloading = true;
                                              });
                                              form.save();

                                              var response =
                                                  authProvider.updateUser(us);
                                              response.then((value) {
                                                if (value != null) {
                                                  setState(() {
                                                    isloading = false;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content:
                                                          CustomSnackBarContent(
                                                        color: AppColors
                                                            .greenColor,
                                                        title: 'Message',
                                                        content: 'User Updated',
                                                      ),
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      elevation: 1,
                                                    ),
                                                  );
                                                } else if (value ==
                                                    authProvider.user) {
                                                  setState(() {
                                                    isloading = false;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content:
                                                          CustomSnackBarContent(
                                                        color:
                                                            AppColors.redColor,
                                                        title: 'Message',
                                                        content:
                                                            'User not Updated',
                                                      ),
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      elevation: 1,
                                                    ),
                                                  );
                                                }
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            fixedSize:
                                                Responsive.isMobile(context)
                                                    ? hovered
                                                        ? const Size(190, 50)
                                                        : const Size(180, 40)
                                                    : hovered
                                                        ? const Size(210, 65)
                                                        : const Size(200, 55),
                                            backgroundColor: Colors.white,
                                            shadowColor: AppColors.gradient1,
                                            //side: BorderSide(color:AppColors.gradient1),
                                          ),
                                          child: isloading
                                              ? const CircularProgressIndicator(
                                                  color: AppColors.gradient1,
                                                )
                                              : const TextWidget(
                                                  text: "Update",
                                                  color: AppColors.gradient1,
                                                  size: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
