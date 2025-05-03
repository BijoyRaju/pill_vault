import 'package:flutter/material.dart';
import 'package:pill_vault/widgets/text_field.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/views/home/components/medicine_fav_card.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title:Text("Search",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 12,),
            TextFieldCustom(hintText: "Search Medicine..."),
            SizedBox(width: 20,),
            MedicineFavCard(
              backgroundImage: ImageConstants.cardBg,
              avatarImage: ImageConstants.medcineImgRound, 
              medicineName: "Paracetamol", 
              chemicalName: 'Crocin', 
              description: 'Used to relieve mild to moderate pain and reduce fever.')
          ],
        ),
      ),
    ));

  }
}