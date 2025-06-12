
// ignore_for_file: sort_child_properties_last, file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:skin/Features/Disease/presentation/view/widget/Disease_Widget.dart';

class DiseaseView extends StatelessWidget {
  const DiseaseView({Key? key, required this.title, required this.textinfo, required this.imagepath}) : super(key: key);
 final String title ;
  final String textinfo;
  final String imagepath;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: DiseaseWidget(textinfo: textinfo,title: title,imagepath: imagepath,),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFFFFFFF),
              Color.fromARGB(70, 77, 245, 192)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            )
          ),
          ),
      ),
    );
  }
}