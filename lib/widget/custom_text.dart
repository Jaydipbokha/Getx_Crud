import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String stText;
  final Color? stColor;
  final double? stFontSize;
  final FontWeight? stFontWeight; 

  CustomText({
    this.stText = "", 
    this.stColor,
    this.stFontSize,
    this.stFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      stText,
      style: TextStyle(
        color: stColor ?? Colors.black,
        fontSize: stFontSize ?? 12,
        fontWeight: stFontWeight ?? FontWeight.normal, 
      ),
    );
  }
}
