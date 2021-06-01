

import 'package:flutter/material.dart';
import 'package:gui_calculator_app/bmi_sections.dart';
import 'package:gui_calculator_app/constant.dart';
import 'package:gui_calculator_app/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        title: Text('BMI CALCULATOR', textAlign: TextAlign.center,) ,
      ),
      body: Column(
         mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text('Your Result', style: kLargeTitleStyle,),
                ),
            ),
            Expanded(
              flex: 5,
                child: BmiSections(
                  colour: kActiveBmiSectionsColour,
                  customChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('NORMAL', style: kResultTextStyle,),

                      Text('22.1', style: kBmiResultStyle,),

                      RichText(text: TextSpan(
                          children: [  TextSpan(text: 'Normal BMI range: \n', style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold,), ),
                                       TextSpan(text: '18.5 - 25kg/cm2', style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold,),),
                            ],

                        ),
                        textAlign: TextAlign.center,
                        ),

                      Text('You have a normal body\n weight. Good job!', style: kBodyTextStyle, textAlign: TextAlign.center, ),

                      SizedBox(
                        width: 200,
                        height: 60,
                        child: TextButton(
                         style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF0A0E21)),
                          ),
                          child: Text('SAVE RESULT', style: kBodyTextStyle,),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ) ,
                ),
            ),
            BottomButton(onTap:() {
              Navigator.pop(context);
            },
                buttonTitle:'RE-CALCULATE YOUR BMI'),
          ],
        ),
    );
  }
}
