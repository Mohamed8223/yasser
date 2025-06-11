// ignore_for_file: file_names

class DiseaseModel {
  final String name;
  final String description;
  final String imageUrl;

  const DiseaseModel({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

const List<DiseaseModel> diseaseData = [
  DiseaseModel(
    name: 'Measles',
    description:
        'Measles is a highly contagious, serious airborne disease caused by a virus',
    imageUrl:
        'assets/images/Measles.jpg', // A generic rash image
  ),
  DiseaseModel(
    name: 'Hand Eczema',
    description:
        'Hand eczema is fairly common. It affects around 10% of people in the United States',
    imageUrl:
        'assets/images/Hand Eczema.jpg', // Image of hands with dry skin
  ),
  DiseaseModel(
    name: 'Alopecia',
    description:
        'Alopecia areata is an autoimmune disorder that causes hair to fall out',
    imageUrl:
        'assets/images/Alopecia.jpg', // Image representing hair loss
  ),
  DiseaseModel(
    name: 'Chickenpox',
    description:
        'Chickenpox is a highly contagious viral infection, commonly affecting children',
    imageUrl:
        'assets/images/Chickenpox.jpg', // Another generic rash image
  ),
  DiseaseModel(
    name: 'Systemic lupus erythematosus',
    description:
        'Systemic lupus erythematosus (SLE) is a chronic autoimmune disease',
    imageUrl:
        'assets/images/Systemic lupus erythematosus.jpg', // Another generic rash image
  ),
  DiseaseModel(
    name: 'Psoriasis',
    description:
        'Psoriasis is a skin condition that causes flaky patches of skin which form scales',
    imageUrl:
        'assets/images/Psoriasis.jpg', // Another generic rash image
  ),
];