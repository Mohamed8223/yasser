// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skin/Features/log/presentation/view/login%20view.dart';
import 'package:skin/Features/signup/presentation/view/sign%20view.dart';
import 'package:skin/core/constant.dart';
import 'package:skin/core/widgets/D%20text.dart';

class WelcomDetialsWidget extends StatefulWidget {
  const WelcomDetialsWidget({super.key});

  @override
  State<WelcomDetialsWidget> createState() => _WelcomDetialsWidgetState();
}

class _WelcomDetialsWidgetState extends State<WelcomDetialsWidget> {
   
  final List<String> textlist=[
    'Welcome to Ensomina Earser chat, where our advanced AI engages in conversations to assist you in understanding and diagnosing potential health concerns, providing insightful guidance on your well-being"',
    '"an extraordinary library curated for the sole purpose of serenity. Within its walls, discover a harmonious collection of books that gently cradle your mind, novels that weave dreams of tranquility, and melodies that embrace you in a lullaby of relaxation. Immerse yourself in this haven, where the magic of literature and melodies collaborates to escort you into a blissful realm of sleep and repose".',
    'Now you can consult the best doctors easily while staying at home through Ensomina Earser app Telehealth service".',
    '"a cutting-edge section designed to seamlessly integrate into your daily life, guiding you towards a healthier routine. By leveraging personalized insights and reminders, this innovative tool empowers individuals to make sustainable lifestyle choices, fostering long-term well-being."',
    'Embark on a serene journey of self-discovery in our special meditation session, where tranquility meets mindfulness. Immerse yourself in a soothing atmosphere, guided by experienced practitioners, as you unwind and reconnect with your inner calm. Join us for a transformative experience of relaxation and rejuvenation.'
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          CarouselSlider.builder(itemCount: textlist.length, itemBuilder: (context, index, realIndex) =>  Padding(
            padding:  EdgeInsets.all(width*0.095),
            child: defaultText(
                    text: textlist[index],
                    color: kcolor1,
                    size: width * 0.04,
                    fontWeight: FontWeight.bold),
          ), options: CarouselOptions(
            height: height*0.5,          ),
          ),
            Gap(height * 0.02),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(kcolor1),
                
              ),
              onPressed: () {
                 Navigator.push(context,  MaterialPageRoute(builder: (context) => SignView(),));
              },
              child: defaultText(
                  text: "Create a new account",
                  color: Colors.white,
                  size: width * 0.05,
                  fontWeight: FontWeight.bold),
            ),
            Gap(height * 0.008),
            TextButton(
              
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              },
              child: defaultText(
                  text: "Login to my account",
                  color: kcolor1,
                  size: width * 0.05,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}
