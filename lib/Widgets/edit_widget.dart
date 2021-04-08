import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  const EditWidget({
    this.controller,
    this.label = '',
    this.onPressed,
    this.info = '',
  });
  final TextEditingController controller;
  final String label;
  final String info;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              info == null ? 'Not added yet' : info,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.edit,
            color: Colors.grey[400],
            size: 25.0,
          ),
        ),
      ],
    );
  }
}
