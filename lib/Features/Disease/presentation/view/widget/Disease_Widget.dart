// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:skin/core/widgets/D%20bottom.dart';
import 'package:skin/core/widgets/D%20text.dart';

class DiseaseWidget extends StatelessWidget {
  const DiseaseWidget({super.key, required this.title, required this.textinfo, required this.imagepath});

  final String title ;
  final String textinfo;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    // Define colors and text styles for easy management
    const Color primaryColor = Color(0xFF2A7870);

    // Placeholder image

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Custom Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: primaryColor, size: 30),
                  onPressed: () {
                    // In a real app, this would pop the navigator
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                 Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Image with Border
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(
                  imagepath,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Content Title
             Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),

            defaultText(
                text:textinfo,
                 color: Colors.black,
                size: 13,
                fontWeight: FontWeight.normal),
            const SizedBox(height: 30),

            // Action Buttons
            buildActionButton("ok", primaryColor, 20, () {
              Navigator.pop(context);
            }),
            const SizedBox(height: 12),
            buildActionButton("Talk With Chatbot", primaryColor, 20, () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
