import 'dart:typed_data';
import 'package:flutter/material.dart';

class AddPhotoAvatar extends StatelessWidget {
  final double radius;
  final String label;
  final VoidCallback onTap;
  final Uint8List? image;

  const AddPhotoAvatar({
    super.key,
    this.radius = 80,
    this.label = "Add a Photo",
    required this.onTap,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: const Color(0xFFC6FCEF),
        backgroundImage: image != null ? MemoryImage(image!) : null,
        child:
            image == null
                ? Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 98, 98, 98),
                    fontStyle: FontStyle.italic
                    ),
                )
                : null,
      ),
    );
  }
}
