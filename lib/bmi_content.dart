
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constantes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_calculator.dart';



abstract class BmiContent{

  List<Widget> build();

}

class IconLabel extends BmiContent{
  String textBox;
  IconData iconImage;

  IconLabel({this.textBox,this.iconImage});

  @override
  List<Widget> build() {
    return [
        Icon(
          this.iconImage,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textBox,
          style: kSimpleTextStyle,
        ),
    ];
  }
}

class SlideBar extends BmiContent{
  int height ;
  Function onChange;
  SlideBar({@required this.height, @required this.onChange});
  @override
  List<Widget> build() {
    return [
      Text(
        "HEIGHT",
        style: kSimpleTextStyle,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            height.toString(),
            style: kSimpleNumberStyle,
          ),
          Text(
            "cm",
            style: kSimpleTextStyle,
          ),
        ],
      ),
      Slider(
        value: height.toDouble(),
        min: 50.0,
        max: 300.0,

        onChanged: this.onChange,
      ),
    ];
  }

}

class MinusPlusContent extends BmiContent{
  int weight;
  String header;
  Function onPlusPressed;
  Function onMinusPressed;

  MinusPlusContent({this.header:"", this.onPlusPressed, this.onMinusPressed, this.weight});

  @override
  List<Widget> build() {
    return[
        Text(
          this.header,
          style: kSimpleTextStyle,
        ),
        Text(
          weight.toString(),
          style: kSimpleNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed:onMinusPressed,
            ),
            RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: onPlusPressed,
            ),
          ],
        )
    ];
  }

}
class ResultContent extends BmiContent{
  final BmiCalculator bmiCalculator;
  ResultContent({this.bmiCalculator});
  @override
  List<Widget> build() {
    return [
      Text(
          this.bmiCalculator.getResult(),
          style: kResultTextStyle,
      ),
      Text(
          this.bmiCalculator.calculateBMI(),
          style: kBMITextStyle,
      ),

      Text(
          this.bmiCalculator.getInterpretation(),
          style: kBodyTextStyle,
          textAlign: TextAlign.center,
      ),
    ];
  }

}

class RoundIconButton extends StatelessWidget{
  final IconData icon;
  final Function onPressed;
  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 12.0,
        child: Icon(this.icon),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: 45.0,
          height: 45.0
        ),
    );
  }

}
