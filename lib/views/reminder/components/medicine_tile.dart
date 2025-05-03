import 'package:flutter/material.dart';

class MedicineTile extends StatelessWidget {
  final String medicineName;
  final String schedule;
  final bool isChecked;
  final Function(bool?) onChanged;

  const MedicineTile({
    super.key,
    required this.medicineName,
    required this.schedule,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/image/card_bg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          medicineName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Text(
                "Schedule: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                schedule,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: Colors.teal,
        ),
      ),
    );
  }
}
