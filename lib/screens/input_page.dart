import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/square_expanded.dart';
import 'package:bmi_calculator/constantes.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bmi_content.dart';
import '../components/bottom_button.dart';
import '../gender_enum.dart';






class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kActiveCardColor;
  Color femaleColor = kActiveCardColor;
  int height = 180;
  int weight =60;
  int age = 19;
  Function activeGender(Gender gender){
    return () {
      setState(() {
        this.maleColor =
        gender == Gender.male ? kActiveCardColor : kInactiveCardColor;
        this.femaleColor =
        gender == Gender.female ? kActiveCardColor : kInactiveCardColor;
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
                      color:kActiveCardColor,
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
                      color:kActiveCardColor,
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
                        color:kActiveCardColor,
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
          BottomButton(
              label: 'Calculate',

              onTap:  (){
                BmiCalculator calc =BmiCalculator(height:this.height,weight: this.weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> ResultPage(
                          bmiCalculator: calc,
                        )
                    ),
                );
              },
          )
        ],
      )

    );
  }
}







