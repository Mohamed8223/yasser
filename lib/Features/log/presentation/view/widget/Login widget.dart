// ignore_for_file: file_names, sized_box_for_whitespace, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skin/Features/Home/presentation/view/Home_View.dart';
import 'package:skin/Features/signup/presentation/view/sign%20view.dart';
import 'package:skin/core/constant.dart';
import 'package:skin/core/widgets/D%20textfeild.dart';
import 'package:skin/firebase_options.dart'; // Assuming this is your text field widget

// 1. Convert to StatefulWidget
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // 2. Create Controllers and State Variables
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  // 3. Implement the Firebase Login Logic
  Future<void> _login() async {
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
    // Show loading indicator
    setState(() {
      _isLoading = true;
      _errorMessage = null; // Clear previous errors
    });

    try {
      print("mmmmmmmmmmmmmmmmmmmmmmmmm");
      // Use Firebase to sign in
     var respon= await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
      // Navigate to Home screen on success
      // The 'mounted' check is a good practice for async operations in State objects
      if (respon.user == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors
      if (e.code == 'user-not-found') {
        _errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        _errorMessage = 'The email address is not valid.';
      } else {
        _errorMessage = 'Email or Password is Rong. Please try again.';
      }
      debugPrint(e.toString()); // For developer logs
    } catch (e) {
      // Handle other generic errors
      _errorMessage = 'An unexpected error occurred.';
      debugPrint(e.toString());
    } finally {
      // Hide loading indicator
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // 4. Clean up controllers when the widget is removed
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        child: Stack(
          children: [
            // Background decorations... (no changes here)
            Positioned(
              top: -size.height * 0.15,
              left: -size.height * 0.20,
              child: Container(
                height: size.height * 0.5,
                width: size.height * 0.5,
                decoration: const BoxDecoration(
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // The Login Form
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 4),
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

                  // E-mail Field with Controller
                  buildTextField(
                    hintText: 'E-mail',
                    controller: _emailController, // 5. Assign controller
                  ),
                  const SizedBox(height: 20),

                  // Password Field with Controller
                  buildTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _passwordController, // 5. Assign controller
                  ),

                  // 6. Display Error Message if it exists
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  const SizedBox(height: 40),

                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ElevatedButton(
                      // Disable button while loading
                      onPressed: _isLoading ? null : _login, // 7. Call the _login method
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcolor1,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const StadiumBorder(),
                      ),
                      // 8. Show loading indicator or text
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Sign Up Text... (no changes here)
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignView()),
                            );
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
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// NOTE: Your buildTextField must accept a controller.
// It probably looks something like this:
/*
Widget buildTextField({
  required String hintText,
  bool obscureText = false,
  TextEditingController? controller, // Added this line
}) {
  return TextField(
    controller: controller, // And used it here
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      // ... your other styling
    ),
  );
}
*/