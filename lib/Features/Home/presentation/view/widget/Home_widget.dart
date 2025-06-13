// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:skin/Features/Home/data/Disease_Model.dart';
import 'package:skin/Features/Home/presentation/view/widget/Disease_Card.dart';
import 'package:skin/core/constant.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final _searchController = TextEditingController();
  List<DiseaseModel> _filteredDiseases = [];

  @override
  void initState() {
    super.initState();
    _filteredDiseases = diseaseData;
    _searchController.addListener(_filterDiseases);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterDiseases);
    _searchController.dispose();
    super.dispose();
  }

  void _filterDiseases() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredDiseases = diseaseData;
      } else {
        _filteredDiseases = diseaseData.where((disease) {
          return disease.name.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
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

              TextField(
                controller: _searchController, 
                decoration: InputDecoration(
                  hintText: 'Search for a disease...',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
              const SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredDiseases.length, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.33,
                ),
                itemBuilder: (context, index) {
                  return DiseaseCard(disease: _filteredDiseases[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}