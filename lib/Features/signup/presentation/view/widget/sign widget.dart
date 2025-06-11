// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skin/Features/Home/presentation/view/Home_View.dart';
import 'package:skin/core/constant.dart';
import 'package:skin/core/widgets/D%20textfeild.dart';

class SignWidget extends StatelessWidget {
  const SignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
        child: Container(
          // Use screen height to ensure the content fits and SingleChildScrollView works
          height: size.height,
          child: Stack(
            children: [
              // 1. The Curved Background Shape
              Positioned(
                // Positioned from the top left corner
                top: -size.height * 0.15,
                left: -size.height * 0.20,
                child: Container(
                  height: size.height * 0.5,
                  width: size.height * 0.5,
                  decoration: BoxDecoration(
                     // The blue border color
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: -size.height * 0.15,
                left: -size.height * 0.1,
                child: Container(
                  height: size.height * 0.5,
                  width: size.height * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:AssetImage("assets/images/login.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 2. The Login Form
             Padding(
               padding: const EdgeInsets.all(20.0),
               
               child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Title
                            Gap(size.height*0.3),
                            const Text(
                              'Create Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: kcolor1,
                              ),
                            ),
                            const SizedBox(height: 24.0),
               
                            // First and Last Name Fields
                            Row(
                              children: [
                                Expanded(
                                  child: buildTextField(hintText: 'First name'),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: buildTextField(hintText: 'Last name'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
               
                            // Date of Birth Section
                           
                            Row(
                              children: [
                                Expanded(flex: 2, child: _buildDateField(value: '24')),
                                const SizedBox(width: 12.0),
                                Expanded(flex: 3, child: _buildDateField(value: 'Dec')),
                                const SizedBox(width: 12.0),
                                Expanded(flex: 3, child: _buildDateField(value: '2012')),
                              ],
                            ),
                            const SizedBox(height: 16.0),
               
                            // Other Text Fields
                            buildTextField(hintText: 'Email Address'),
                            const SizedBox(height: 16.0),
                            buildTextField(hintText: 'New Password', obscureText: true),
                            const SizedBox(height: 16.0),
                            buildTextField(hintText: 'Repeat Password', obscureText: true),
                            const SizedBox(height: 32.0),
               
                            // Create Account Button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView(),));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kcolor1,
                                padding: const EdgeInsets.symmetric(vertical: 18.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
             ),],
          ),
        ),
      )
   ;
  }
   Widget _buildDateField({required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.black87)),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade700, width: 1.5),
            ),
            child: Icon(
              Icons.expand_more,
              size: 18,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}