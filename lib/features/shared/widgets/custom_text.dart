import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.letterSpacing,
    this.wordSpacing,
    this.overflow,
    this.style,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style,
      // style: TextStyle(
      //   fontSize: fontSize,
      //   fontFamily: fontFamily,
      //   fontWeight: fontWeight,
      //   letterSpacing: letterSpacing,
      //   wordSpacing: wordSpacing,
      //   overflow: overflow,
      // ),
    );
  }
}
