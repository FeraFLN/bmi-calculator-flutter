import 'package:bmi_calculator/bmi_content.dart';
import 'package:flutter/material.dart';

class SquareContainer extends StatelessWidget {
  SquareContainer({@required this.colour,this.bmiContent});
  final Color colour;
  final BmiContent bmiContent;

  @override
  Widget build(BuildContext context) {
    List<Widget> list=[];
    if(bmiContent!=null){
      list = bmiContent.build();
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
