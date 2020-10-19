import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/bmi_content.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/square_expanded.dart';
import 'package:flutter/material.dart';

import '../constantes.dart';


class ResultPage extends StatelessWidget {
  final BmiCalculator bmiCalculator;

  ResultPage ({this.bmiCalculator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Container(
              child: Center(
                child: Text(
                  "Your Result",
                  style: kTitleTextStyle,
                ),
              ),
            ),

           SquareExpanded(
              color: kActiveCardColor,
              bmiContent: ResultContent(bmiCalculator: bmiCalculator),
          ),

          BottomButton(
            label: 'Re-Calculate',
            onTap:  (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
