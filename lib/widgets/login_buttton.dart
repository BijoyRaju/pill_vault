import 'package:flutter/material.dart';

class LoginButtton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String imagePath;

  const LoginButtton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.imagePath
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFE0E0E5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        foregroundColor: Colors.black
      ),
      child: Row(
        children: [
         Image.asset(imagePath,height: 20,width: 20,),
         SizedBox(width: 10,),
         Text(title),
        ],
      ),
      );
  }
}