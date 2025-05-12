import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/data/database.dart';
import 'package:pill_vault/views/bottom_navigations/bottom_navigations.dart';

class MedicineServices {
  static Future<void> addOrUpdateMedicine({
    required BuildContext context,
    required Database medicine,
    required bool isEdit,
    int? index
  })async{
    final box = await Hive.openBox<Database>('mybox');

    if(isEdit && index != null){
      await box.putAt(index, medicine);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(TextConstants.updMsg))
      );
    }else{
      await box.add(medicine);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(TextConstants.addMsg))
      );
    }
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigations()));
  }


}