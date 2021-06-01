

import 'package:flutter/material.dart';
import 'package:gui_calculator_app/data_input_page.dart';


void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        primaryColor:Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      home: DataInputPage(),
    );
  }
}

