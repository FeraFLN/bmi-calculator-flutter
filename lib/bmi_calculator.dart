
import 'dart:math';

class BmiCalculator {

  final int weight;
  final int height;
  double _bmi;

  BmiCalculator({this.weight,this.height});

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String getResult(){
    calculateBMI();
    if(_bmi>25){
      return "Overweight";
    }else if(_bmi > 18.5 ){
      return "Normal";
    }else{
      return "Underweight";
    }
  }
  String getInterpretation(){
    calculateBMI();
    if(_bmi>25){
      return "You have a higher than normal body weight. Try exercise more.";
    }else if(_bmi > 18.5 ){
      return "You have a normal body weight. God job!";
    }else{
      return "You have lower than normal body weight. You can eat a bit more";
    }
  }


}