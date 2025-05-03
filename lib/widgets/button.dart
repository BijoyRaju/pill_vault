import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onPressed;
  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF07E5B0),
      foregroundColor: Colors.white
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,style: TextStyle(fontSize: 16),),
        if(icon != null) ...[
          SizedBox(width: 5,),
          Icon(icon)
        ],
      ],
    )
    );
  }
}