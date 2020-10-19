import 'package:bmi_calculator/components/square_container.dart';
import 'package:flutter/material.dart';

import '../bmi_content.dart';

class SquareExpanded extends StatelessWidget {
  SquareExpanded({@required this.color,this.bmiContent,this.onTap});
  final Color color;
  final BmiContent bmiContent;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: GestureDetector(
            onTap: this.onTap,
            child: SquareContainer(colour: color,bmiContent: bmiContent)
        )
    );

  }
}