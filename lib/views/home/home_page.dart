import 'package:flutter/material.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/views/home/components/medicine_card.dart';
import 'package:pill_vault/views/home/components/medicine_fav_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                ImageConstants.homeBg,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextConstants.recentlyAdded,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        MedicineCard(imagePath: ImageConstants.medicineImg, medicineName: "Paracetamol"),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Favorites",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    MedicineFavCard(
                      backgroundImage: ImageConstants.cardBg,
                      avatarImage: ImageConstants.medcineImgRound,
                      medicineName: 'Paracetamol', chemicalName: 'Crocin', 
                      description: 'Used to relieve mild to moderate pain and reduce fever.'),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
