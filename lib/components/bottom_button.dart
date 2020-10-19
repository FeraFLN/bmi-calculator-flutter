import 'package:flutter/material.dart';

import '../constantes.dart';

const double heightBotton = 80.0;

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String label;

  BottomButton({this.onTap,this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: heightBotton,
        alignment: AlignmentDirectional.center,
        child: Text(
          label,
          style: kLargeButtonTextStyle,
        ) ,
      ),
    );
  }
}