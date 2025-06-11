// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class defaultText extends StatelessWidget{

  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const defaultText({super.key, required this.text, required this.color, required this.size, required this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return  Text(text,textAlign: TextAlign.center,style: TextStyle(color: color,fontSize: size,fontWeight: fontWeight),);
  }
}