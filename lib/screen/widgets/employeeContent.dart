import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

class EmployeeCardContent extends StatefulWidget {
  final int emprunts;
  final Color color;
  final Color progressIndicatorColor;
  final String projectName;
  final String percentComplete;
  final IconData icon;
  EmployeeCardContent(
      {required this.color,
      required this.progressIndicatorColor,
      required this.projectName,
      required this.percentComplete,
      required this.icon,
      required this.emprunts});

  @override
  State<EmployeeCardContent> createState() => _EmployeeCardContentState();
}

class _EmployeeCardContentState extends State<EmployeeCardContent> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (value) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 275),
        height: hovered ? 220 : 190,
        width: hovered ? 295 : 220,
        decoration: BoxDecoration(
          color: hovered ? widget.color : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    child: Icon(
                      widget.icon,
                      color: !hovered ? Colors.white : Colors.black,
                      size: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: hovered ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Container(
                    child: TextWidget(
                      text: widget.projectName,
                      size: 14,
                      color: hovered ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    height: 13,
                    width: 13,
                    child: Icon(
                      Icons.person,
                      size: 13,
                      color: hovered ? AppColors.white : AppColors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    child: TextWidget(
                      text: widget.emprunts.toString() + ' elements',
                      size: 10,
                      color: hovered ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    height: 13,
                    width: 13,
                    child: Icon(
                      Icons.person,
                      size: 13,
                      color: hovered ? AppColors.white : AppColors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    child: TextWidget(
                      text: '15 nov 2019',
                      size: 10,
                      color: hovered ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  left: 135,
                ),
                child: TextWidget(
                  text: widget.percentComplete,
                  size: 12,
                  color: hovered ? AppColors.white : AppColors.black,
                ),
              ),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 275,
                ),
                margin: const EdgeInsets.only(top: 5),
                height: 6,
                width: 160,
                decoration: BoxDecoration(
                  color: hovered
                      ? widget.progressIndicatorColor
                      : Color(0xFFF5F6FA),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 275),
                    height: 6,
                    width: (double.parse(widget.percentComplete.substring(
                                0, widget.percentComplete.length - 1)) /
                            100) *
                        160,
                    decoration: BoxDecoration(
                      color: hovered ? AppColors.white : widget.color,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
