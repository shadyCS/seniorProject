import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    this.info,
    this.label,
    @optionalTypeArgs this.triling,
  });
  final String label;
  final String info;
  final Icon triling;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Container(
            width: 120.0,
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Text(
            info,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Signika Negative',
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          width: 3.0,
        ),
        triling ?? Container()
      ],
    );
  }
}
