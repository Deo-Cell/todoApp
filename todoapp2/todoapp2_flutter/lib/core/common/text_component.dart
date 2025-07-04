import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final FontStyle? fontstyle;
  final double? fontsize;
  final FontWeight? fontweight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final Color? textcolor;
  final int? maxLines;
  final String? fontfamily;
  final TextDecoration? decoration;
  final Color? decorationcolor;
  final int? decorationthinkness;
  const TextComponent(
    this.text, {
    super.key,
    this.style,
    this.fontstyle,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontsize,
    this.fontweight,
    this.textcolor,
    this.fontfamily,
    this.decoration,
    this.decorationcolor,
    this.decorationthinkness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontweight,
        color: textcolor,
        decoration: decoration,
        decorationColor: decorationcolor,
        decorationThickness: decorationthinkness?.toDouble(),
        fontFamily: fontfamily,
        fontStyle: fontstyle,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}