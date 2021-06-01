import 'package:flutter/material.dart';
import 'package:gui_calculator_app/constant.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [ Icon(icon,
        size: 80,
        color: Colors.white,
      ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label, style:kIconLabelStyle,
        ),
      ],
    );
  }
}