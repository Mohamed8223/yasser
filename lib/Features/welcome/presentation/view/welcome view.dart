// ignore_for_file: file_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:skin/Features/welcome/presentation/view/widget/welcom%20widget.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Welcomwidget(),
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