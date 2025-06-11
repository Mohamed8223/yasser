
// ignore_for_file: sort_child_properties_last, file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:skin/Features/Home/presentation/view/widget/Home_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: HomeWidget(),
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