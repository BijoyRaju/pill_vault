import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String contexts;
  const CustomContainer({
    super.key,
    required this.contexts
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              color: const Color.fromARGB(255, 219, 219, 219),
              blurRadius: 7,
            )
          ]
        ),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Icon(Icons.trending_up,color: Color(0xFF74001B),),
              SizedBox(width: 10),
              Text(contexts,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 116, 89),
                fontStyle: FontStyle.italic
              ),),
            ],
          ),
        ),
      ),
    );

  }
}