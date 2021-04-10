import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  ButtonWidget({
    this.text = ' ',
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: kPrimaryColor,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Signika Negative',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
  }
}

class SecondryButton extends StatelessWidget {
  final String text;
  final Function onTap;
  SecondryButton({
    this.text = ' ',
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
