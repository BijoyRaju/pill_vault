import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String imagePath;
  final String medicineName;

  const MedicineCard({
    super.key,
    required this.imagePath,
    required this.medicineName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 140,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                medicineName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
