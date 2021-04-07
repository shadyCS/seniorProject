import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget(
      {this.hintText, this.controller, this.height = 50, this.maxLines = 3});
  final String hintText;
  final TextEditingController controller;
  final double height;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: kPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
