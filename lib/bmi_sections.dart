
import 'package:flutter/material.dart';


class BmiSections extends StatelessWidget {
  BmiSections({@required this.colour, this.customChild});
  final Color colour ;
  final Widget customChild;

  @override
  Widget build(BuildContext context) {
    return

      GestureDetector(
        child:Container(
        child: customChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: (BorderRadius.circular(10.0)),
        ),
      )
    );

  }
}
