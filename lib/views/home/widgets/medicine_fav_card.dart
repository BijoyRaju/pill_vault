import 'package:flutter/material.dart';

class MedicineFavCard extends StatelessWidget {
  final String backgroundImage;
  final String avatarImage;
  final String medicineName;
  final String chemicalName;
  final String description;
  VoidCallback? onTap;

  MedicineFavCard({
    super.key,
    required this.backgroundImage,
    required this.avatarImage,
    required this.medicineName,
    required this.chemicalName,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 135,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(avatarImage),
                ),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    medicineName,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            // Right Side: Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chemicalName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(color: Colors.black87, fontSize: 13),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
