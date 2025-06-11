
// ignore_for_file: sort_child_properties_last, file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:skin/Features/signup/presentation/view/widget/sign%20widget.dart';

class SignView extends StatelessWidget {
  const SignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SignWidget(),
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