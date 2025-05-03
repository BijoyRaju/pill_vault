import 'package:flutter/material.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:pill_vault/widgets/text_field.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/views/medicine_add/components/add_photo_avatar.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Add Medicine",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              AddPhotoAvatar(),
              SizedBox(height: 10,),
              TextFieldCustom(hintText: TextConstants.medicineName),
              SizedBox(height: 10,),
              TextFieldCustom(hintText: TextConstants.chemicalName),
              SizedBox(height: 10,),
              TextFieldCustom(hintText: TextConstants.dosage),
              SizedBox(height: 10,),
              TextFieldCustom(hintText: TextConstants.price),
              SizedBox(height: 10,),
              TextFieldCustom(hintText: TextConstants.description,maxlines: 5,),
              SizedBox(height: 10),
              Button(title: TextConstants.submit, onPressed: (){})
            ],
            
          ),
        ),
      ),
    ));
  }
}