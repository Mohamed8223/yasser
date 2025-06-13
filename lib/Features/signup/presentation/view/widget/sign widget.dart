// ignore_for_file: file_names, sized_box_for_whitespace, use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:skin/Features/Home/presentation/view/Home_View.dart';
import 'package:skin/core/constant.dart';
import 'package:skin/core/widgets/D%20textfeild.dart';

class SignWidget extends StatefulWidget {
  const SignWidget({super.key});

  @override
  State<SignWidget> createState() => _SignWidgetState();
}

class _SignWidgetState extends State<SignWidget> {
  // 2. Create Controllers and State Variables
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  DateTime? _selectedDate;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _createAccount() async {
    if (_passwordController.text != _repeatPasswordController.text) {
      setState(() => _errorMessage = 'Passwords do not match.');
      return;
    }
    if (_selectedDate == null) {
      setState(() => _errorMessage = 'Please select your date of birth.');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeView()),
            (Route<dynamic> route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMessage = 'An account already exists for that email.';
      } else {
        _errorMessage = 'An error occurred. Please try again.';
      }
      debugPrint(e.toString());
    } catch (e) {
      _errorMessage = 'An unexpected error occurred.';
      debugPrint(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
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
            Positioned(
              top: -size.height * 0.15,
              left: -size.height * 0.20,
              child: Container(
                height: size.height * 0.5,
                width: size.height * 0.5,
                decoration: const BoxDecoration(shape: BoxShape.circle),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(size.height * 0.25),
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
                  Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          hintText: 'First name',
                          controller: _firstNameController, // Assign controller
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: buildTextField(
                          hintText: 'Last name',
                          controller: _lastNameController, // Assign controller
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: _buildDateField(
                            value: _selectedDate == null
                                ? 'Day'
                                : _selectedDate!.day.toString(),
                            onTap: () => _selectDate(context),
                          )),
                      const SizedBox(width: 12.0),
                      Expanded(
                          flex: 3,
                          child: _buildDateField(
                            value: _selectedDate == null
                                ? 'Month'
                                : DateFormat.MMM().format(_selectedDate!),
                            onTap: () => _selectDate(context),
                          )),
                      const SizedBox(width: 12.0),
                      Expanded(
                          flex: 3,
                          child: _buildDateField(
                            value: _selectedDate == null
                                ? 'Year'
                                : _selectedDate!.year.toString(),
                            onTap: () => _selectDate(context),
                          )),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                      hintText: 'Email Address', controller: _emailController),
                  const SizedBox(height: 16.0),
                  buildTextField(
                      hintText: 'New Password',
                      obscureText: true,
                      controller: _passwordController),
                  const SizedBox(height: 16.0),
                  buildTextField(
                      hintText: 'Repeat Password',
                      obscureText: true,
                      controller: _repeatPasswordController),
                  const SizedBox(height: 16.0),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _createAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kcolor1,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField({required String value, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value,
                style: const TextStyle(fontSize: 16, color: Colors.black87)),
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
      ),
    );
  }
}
