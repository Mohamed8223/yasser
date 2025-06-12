// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:skin/Features/Home/data/Disease_Model.dart';
import 'package:skin/Features/Home/presentation/view/widget/Disease_Card.dart';
import 'package:skin/core/constant.dart';

class HomeWidget extends StatelessWidget{
  const HomeWidget({super.key});
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Title and Profile Avatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Diseases',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: kcolor1,
                      ),
                    ),
                   
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'search',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon:
                        Icon(Icons.search, color: Colors.grey.shade600),
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
                const SizedBox(height: 20),

                // Diseases Grid
                GridView.builder(

                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: diseaseData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.5, // Adjust ratio to match the card height
                  ),
                  itemBuilder: (context, index) {
                    return  DiseaseCard(disease: diseaseData[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      );
  
  }
}