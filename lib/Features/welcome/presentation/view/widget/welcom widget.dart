// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skin/Features/welcome/presentation/view/welcom%20detials%20view.dart';
import 'package:skin/core/constant.dart';
import 'package:skin/core/widgets/D%20text.dart';

class Welcomwidget extends StatelessWidget {
  const Welcomwidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: CircleBorder(),
                elevation: 8,
                shadowColor: Colors.black,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.jpg"),
                  radius: width * 0.3,
                ),
              ),
              Gap(height * 0.02),
              defaultText(
                  text: 'Skin Diseases',
                  color: kcolor1,
                  size: width * 0.1,
                  fontWeight: FontWeight.bold),
              Gap(height * 0.02),
              defaultText(
                  text: "Your clinic in any Time For skin Diseases",
                  color: Colors.white,
                  size: width * 0.07,
                  fontWeight: FontWeight.normal),
              Gap(height * 0.02),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  enableFeedback: true,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomDetialsView(),
                      ));
                },
                child: defaultText(
                    text: "Get Started",
                    color: kcolor1,
                    size: width * 0.08,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
