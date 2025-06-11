// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:skin/Features/Home/presentation/view/Home_View.dart';
import 'package:skin/Features/signup/presentation/view/sign%20view.dart';
import 'package:skin/core/constant.dart';
import 'package:skin/core/widgets/D%20textfeild.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

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
                    const Spacer(flex: 4), // Pushes the form down
                    const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kcolor1,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    
                    // E-mail Field
                    buildTextField( hintText: 'E_mail'),
                    const SizedBox(height: 20),
                
                    // Password Field
                    buildTextField(hintText: 'Password', obscureText: true),
                    const SizedBox(height: 40),
                
                    // Login Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.push(context,  MaterialPageRoute(builder: (context) => HomeView(),));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcolor1,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                
                    // Sign Up Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Do You have Account? ',
                          style: TextStyle(color: kcolor1, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle sign up navigation
                          },
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => SignView(),));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: kcolor1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2), // Provides space at the bottom
                  ],
                ),
              ),
            ],
          ),
        ),
      )
   ;
  }
}