
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gui_calculator_app/bmi_sections.dart';
import 'package:gui_calculator_app/icon_content.dart';
import 'package:gui_calculator_app/constant.dart';
import 'package:gui_calculator_app/result_page.dart';
import 'package:gui_calculator_app/bottom_button.dart';


int height = 180;


class DataInputPage extends StatefulWidget {
  @override
  _DataInputPageState createState() => _DataInputPageState();
}

class _DataInputPageState extends State<DataInputPage> {
  int weight = 60;
  int age = 3;


  Color maleCardColour = kInactiveBmiSectionsColour;
  Color femaleCardColour = kInactiveBmiSectionsColour;

  void updateColor(int gender) {
    //male card press
    if (gender == 1) {
      if (maleCardColour == kInactiveBmiSectionsColour) {
        maleCardColour = kActiveBmiSectionsColour;
        femaleCardColour = kInactiveBmiSectionsColour;
      } else {
        maleCardColour = kInactiveBmiSectionsColour;
      }
    }

    if (gender == 2){
      if (femaleCardColour == kInactiveBmiSectionsColour) {
        femaleCardColour = kActiveBmiSectionsColour;
        maleCardColour = kInactiveBmiSectionsColour;
      } else {
        maleCardColour = kInactiveBmiSectionsColour;
      }
    }
  }


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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: BmiSections(
                      customChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: maleCardColour,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: BmiSections(
                      customChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      colour: femaleCardColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiSections(
              colour: kActiveBmiSectionsColour,
              customChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'HEIGHT',
                    style: kIconLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumLetterStyle,
                      ),
                      Text(
                        'cm',
                        style: kIconLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor:
                        Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height =newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiSections(
                    colour: kActiveBmiSectionsColour,
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kIconLabelStyle,),
                        Text(
                          weight.toString(),
                          style: kNumLetterStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           RoundIconButton(
                                 icon:FontAwesomeIcons.minus,
                                 onPressed: () {
                                   setState(() {
                                     weight--;
                                   });
                                 }
                                ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiSections(
                    colour: kActiveBmiSectionsColour,
                    customChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kIconLabelStyle,),
                        Text(
                          age.toString(),
                          style: kNumLetterStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                 age--;
                                });
                              }
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          BottomButton(buttonTitle: 'CALCULATE YOUR BMI' ,
            onTap:(){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=> ResultsPage(),),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white60,),
      shape:CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width:56.0,
        height: 56.0,
      ),
      elevation: 1.0,
    );
  }
}
