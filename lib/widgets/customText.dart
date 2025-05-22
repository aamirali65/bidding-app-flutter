  import 'package:flutter/material.dart';

  class MyText extends StatelessWidget {
    final String text;
    final double fontSize;
    final FontWeight fontWeight;
    final Color color;
    const MyText({super.key,required this.text,required this.color,required this.fontSize, required this.fontWeight});

    @override
    Widget build(BuildContext context) {
      return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      );
    }
  }
