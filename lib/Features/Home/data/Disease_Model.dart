// ignore_for_file: file_names

class DiseaseModel {
  final String name;
  final String description;
  final String textinfo;
  final String imageUrl;

  const DiseaseModel( {
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.textinfo
  });
}

const List<DiseaseModel> diseaseData = [
  DiseaseModel(
    name: 'Measles',
    description:
        'Measles is a highly contagious, serious airborne disease caused by a virus',
    imageUrl:
        'assets/images/Measles.jpg', 
     textinfo: "Measles is a highly contagious, serious airborne disease caused by a virus that can lead to severe complications and death. Measles vaccination averted more than 60 million deaths between 2000 and 2023. Even though a safe and cost-effective vaccine is available, in 2023, there were an estimated 107 500 measles deaths globally, mostly among unvaccinated or under vaccinated children under the age of 5 years. The proportion of children receiving a first dose of measles vaccine was 83% in 2023, well below the 2019 level of 86%.",
   // A generic rash image
  ),
  DiseaseModel(
    name: 'Hand Eczema',
    description:
        'Hand eczema is fairly common. It affects around 10% of people in the United States',
    imageUrl:
        'assets/images/Hand Eczema.jpg', 
    textinfo: "Hand eczema is fairly common. It affects around 10% of people in the United States and can develop at any age. It may be acute, lasting only a short time, or chronic, persisting throughout a person’s life. Hand eczema is more common in people with a history of atopic eczema and people in frequent contact with water and chemicals. This may include hairdressers, cleaners, chefs, and healthcare professionals, for example. Hand eczema is not contagious, meaning that it does not pass from person to person. It can interfere with daily activities, and it can cause a person to feel self-conscious. Stress and exposure to irritants and external allergens can trigger or worsen it."// Image of hands with dry skin
  ),
  DiseaseModel(
    name: 'Alopecia',
    description:
        'Alopecia areata is an autoimmune disorder that causes hair to fall out',
    imageUrl:
        'assets/images/Alopecia.jpg',
    textinfo: "Alopecia areata is an autoimmune disorder that causes hair to fall out, often in clumps the size and shape of a quarter. The amount of hair loss is different for everyone. Some people lose hair only in a few spots, while others lose a lot. For some, hair grows back but falls out again later. In others, it grows back for good. There are different types of this condition. Alopecia areata is most common in its main form, but there are other, more rare types: Alopecia areata totalis means you’ve lost all the hair on your head. Alopecia areata universalis is the loss of hair over your entire body. Diffuse alopecia areata is a sudden thinning of your hair rather than lost patches. Ophiasis alopecia areata causes hair loss in a band shape around the sides and back of your head." // Image representing hair loss
  ),
  DiseaseModel(
    name: 'Chickenpox',
    description:
        'Chickenpox is a highly contagious viral infection, commonly affecting children',
    imageUrl:
        'assets/images/Chickenpox.jpg', 
    textinfo:  "Chickenpox is a highly contagious viral infection, most commonly affecting children. It is characterized by a itchy, blister-like rash that spreads across the body. The rash typically begins as small, red bumps that quickly fill with fluid, then crust over and scab. Other symptoms may include fever, headache, and fatigue. Chickenpox is caused by the varicella-zoster virus (VZV), a member of the herpesvirus family. The virus spreads through direct contact with the blisters or respiratory droplets from an infected person's cough or sneeze. While generally mild in children, chickenpox can have more serious complications in adults, such as pneumonia or encephalitis. A vaccine is available to prevent chickenpox and is highly effective."// Another generic rash image
  ),
  DiseaseModel(
    name: 'Systemic lupus erythematosus',
    description:
        'Systemic lupus erythematosus (SLE) is a chronic autoimmune disease',
    imageUrl:
        'assets/images/Systemic lupus erythematosus.jpg',
    textinfo: "Systemic lupus erythematosus (SLE) is a chronic autoimmune disease that can affect various organs in the body. In SLE, the immune system mistakenly attacks healthy tissues and organs, leading to inflammation and damage. Common symptoms include fatigue, joint pain, fever, and a characteristic butterfly-shaped rash across the cheeks and nose. Other potential complications can involve the kidneys, heart, lungs, and nervous system. The exact cause of SLE is unknown, but it is believed to be a combination of genetic and environmental factors. Treatment typically involves medications to suppress the immune system and manage symptoms." // Another generic rash image
  ),
  DiseaseModel(
    name: 'Psoriasis',
    description:
        'Psoriasis is a skin condition that causes flaky patches of skin which form scales',
    imageUrl:
        'assets/images/Psoriasis.jpg',
    textinfo: "Psoriasis is a skin condition that causes flaky patches of skin which form scales. On brown, black and white skin the patches can look pink or red, and the scales white or silvery. On brown and black skin the patches can also look purple or dark brown, and the scales may look grey. These patches normally appear on your elbows, knees, scalp and lower back, but can appear anywhere on your body.  Most people are only affected with small patches. In some cases, the patches can be itchy or sore. Psoriasis affects around 2 in 100 people in the UK. It can start at any age, but most often develops in adults between 20 and 30 years old and between 50 and 60 years old. It affects men and women equally. The severity of psoriasis varies greatly from person to person. For some it's just a minor irritation, but for others it can have a big impact on their quality of life. Psoriasis is a long-lasting (chronic) disease that usually involves periods when you have no symptoms or mild symptoms, followed by periods when symptoms are more severe." // Another generic rash image
  ),
];