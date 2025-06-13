// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:skin/Features/Disease/presentation/view/Disease_view.dart';
import 'package:skin/Features/Home/data/Disease_Model.dart';
import 'package:skin/core/widgets/D%20bottom.dart';

class DiseaseCard extends StatelessWidget {
  final DiseaseModel disease;
  const DiseaseCard({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.sizeOf(context).height;
    // Define card-specific colors.
    const Color cardBackgroundColor = Color(0xFF88D4CA);
    const Color buttonColor = Color(0xFF2A7870);

    return Container(
      height: 500,
      padding: const EdgeInsets.all(10.0),
      
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              disease.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),

          // Disease Name
          Text(
            disease.name,
            style: const TextStyle(
              color: buttonColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          // Disease Description
          Text(
            disease.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),// Pushes buttons to the bottom

          // Action Buttons
          buildActionButton('Read More', buttonColor,13,() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DiseaseView(title: disease.name,textinfo: disease.textinfo,imagepath: disease.imageUrl,),));
          },),
          const SizedBox(height: 2),
          buildActionButton('Talk with chatbot', buttonColor,13,() {
            
          },),
        ],
      ),
    );
  }

  // Helper widget for creating the styled buttons.
 
}