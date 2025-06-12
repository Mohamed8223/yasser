 // ignore_for_file: file_names

 import 'package:flutter/material.dart';

Widget buildActionButton(String text, Color color,double size,Function() function) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        ),
      ),
    );
  }