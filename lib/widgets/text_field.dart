import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final int maxlines;

  const TextFieldCustom({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.maxlines = 1
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic
          ),
          filled: true,
          fillColor: Color(0xFFC6FCEF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none
          ),
        ),
    );
  }
}