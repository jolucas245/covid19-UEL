import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SemiCircleWidget extends StatelessWidget {

  double diameter;

  SemiCircleWidget({ Key? key, this.diameter = 200 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: diameter,
      width: double.infinity,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff296880),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1000.0),
            topRight: Radius.circular(1000.0),
          ),
        ),
      ),
    );
  }
}