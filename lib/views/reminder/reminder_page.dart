import 'package:flutter/material.dart';
import 'package:pill_vault/views/reminder/components/medicine_tile.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Reminder",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [ 
            MedicineTile(
              medicineName: "Paracetamol",
              schedule: "1 - 1 - 1",
              isChecked: true,
              onChanged: (vale){}
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0xFF5ED2D2),
        child: Icon(Icons.notification_add,color: Colors.white,),
        ),
    ),
    );
  }
}