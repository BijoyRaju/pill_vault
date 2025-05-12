import 'package:flutter/material.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/services/medicine_services/medicine_services.dart';
import 'package:pill_vault/widgets/button.dart';

class ConfirmDeleteDialog {
  static Future<void> show({
    required BuildContext context,
    required int index,
  })async{
    final confirm = await showDialog<bool>(
      context: context,
      builder:(context) => AlertDialog(
        title: const Text(TextConstants.confirmDel),
        content: const Text(TextConstants.confirmMsg),
        actions: [
          Button(
            title: "Cancel",
            onPressed:
            () => Navigator.pop(context, false),
          ),
          TextButton(
            onPressed:
            () => Navigator.pop(context, true),
            child: const Text(
            "Delete",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
    );
  if (confirm == true) {
    await MedicineServices.deleteMedicine(
      context: context,
      index: index);
  }
}
}
