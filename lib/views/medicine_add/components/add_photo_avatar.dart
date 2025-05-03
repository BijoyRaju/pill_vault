import 'package:flutter/material.dart';

class AddPhotoAvatar extends StatelessWidget {
  final double radius;
  final String label;

  const AddPhotoAvatar({
    super.key,
    this.radius = 90,
    this.label = "Add a Photo",
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFFC6FCEF),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
