import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/style.dart';

class SharedFilesItems extends StatefulWidget {
  final String sharedFileName;
  final Color color;
  final String members;
  final String et;
  final String filesize;
  SharedFilesItems(
      {required this.sharedFileName,
      required this.color,
      required this.members,
      required this.et,
      required this.filesize});

  @override
  State<SharedFilesItems> createState() => _SharedFilesItemsState();
}

class _SharedFilesItemsState extends State<SharedFilesItems> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 275,
        ),
        margin: const EdgeInsets.only(bottom: 10, left: 40),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 13,
                      spreadRadius: 0,
                    ),
                  ]
                : []),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: widget.color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.folder,
                            color: widget.color,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextWidget(
                        text: widget.sharedFileName,
                        fontWeight: FontWeight.bold,
                        size: 12,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextWidget(
                          text: widget.members,
                          color: Colors.black45,
                          size: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextWidget(
                          text: widget.et,
                          color: Colors.black45,
                          size: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextWidget(
                          text: widget.filesize,
                          color: Colors.black,
                          size: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
