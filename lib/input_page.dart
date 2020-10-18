import 'package:bmi_calculator/bmi_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'square_expanded.dart';


const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const double heightBotton = 80.0;


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = activeCardColor;
  Color femaleColor = activeCardColor;
  int height = 180;
  int weight =60;
  int age = 19;
  Function activeGender(Gender gender){
    return () {
      setState(() {
        this.maleColor =
        gender == Gender.male ? activeCardColor : inactiveCardColor;
        this.femaleColor =
        gender == Gender.female ? activeCardColor : inactiveCardColor;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('BMI Calculator')
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child:Row(
                children: [
                  SquareExpanded(
                      onTap: activeGender(Gender.male),
                      color: maleColor,
                      bmiContent: IconLabel(
                          textBox: "MALE",
                          iconImage: FontAwesomeIcons.mars
                      ),
                  ),
                  SquareExpanded(
                      onTap: activeGender(Gender.female),
                      color:femaleColor,
                      bmiContent: IconLabel(
                          textBox: "FEMALE",
                          iconImage: FontAwesomeIcons.venus
                      ),

                  ),
                ],
              )
          ),
          Expanded(
              child:Row(
                children: [
                  SquareExpanded(
                      color:activeCardColor,
                      bmiContent: SlideBar(
                        height: height,
                        onChange: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                  ),
                ],
          )),
          Expanded(
              child:Row(
                children: [
                    SquareExpanded(
                      color:activeCardColor,
                      bmiContent: MinusPlusContent(
                          header: "WEIGHT",
                          weight: weight,
                          onMinusPressed: (){
                            setState(() {
                                if(weight>0){
                                  weight--;
                                }
                            });
                          },
                          onPlusPressed: (){
                            setState(() {
                              weight++;
                            });
                          }
                      ),

                    ),
                    SquareExpanded(
                        color:activeCardColor,
                        bmiContent: MinusPlusContent(
                            header: "AGE",
                            weight: age,
                            onMinusPressed: (){
                              setState(() {
                                if(age>0){
                                  age--;
                                }
                              });
                            },
                            onPlusPressed: (){
                              setState(() {
                                age++;
                              });
                            }
                        ),
                    ),
                ],
              )
          ),
          Container(
            color: Colors.red,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: heightBotton,
          )
        ],
      )

    );
  }
}

enum Gender{
  male,
  female
}




