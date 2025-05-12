import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pill_vault/data/database.dart';
import 'package:pill_vault/services/medicine_services/medicine_services.dart';
import 'package:pill_vault/views/medicine_add/widgets/confirm_delete_dialog.dart';
import 'package:pill_vault/widgets/button.dart';
import 'package:pill_vault/widgets/text_field.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/views/medicine_add/widgets/add_photo_avatar.dart';

class AddPage extends StatefulWidget {
  final Database? medicine;
  final int? index;

  const AddPage({super.key, this.medicine, this.index});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final medNameController = TextEditingController();
  final chemNameController = TextEditingController();
  final dosageController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  Uint8List? _pickedImage;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    if (widget.medicine != null) {
      medNameController.text = widget.medicine!.medicineName;
      chemNameController.text = widget.medicine!.chemicalName;
      dosageController.text = widget.medicine!.dosage.toString();
      priceController.text = widget.medicine!.price.toString();
      descController.text = widget.medicine!.description ?? '';
      _pickedImage = widget.medicine!.imagePath;
      _isFavorite = widget.medicine!.isFavorite ?? false;
    }
  }

  @override
  void dispose() {
    medNameController.dispose();
    chemNameController.dispose();
    dosageController.dispose();
    priceController.dispose();
    descController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _pickedImage = imageBytes;
      });
    }
  }

  Future<void> _submitMedicine() async {

    if (medNameController.text.isEmpty ||
        chemNameController.text.isEmpty ||
        dosageController.text.isEmpty ||
        priceController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text(TextConstants.scafolfMsg)));
      return;
    }

    final newMedicine = Database(
      medicineName: medNameController.text,
      chemicalName: chemNameController.text,
      dosage: int.tryParse(dosageController.text) ?? 0,
      price: int.tryParse(priceController.text) ?? 0,
      description: descController.text,
      imagePath: _pickedImage,
      isFavorite: _isFavorite
    );

    await MedicineServices.addOrUpdateMedicine(
      context: context,
      medicine: newMedicine,
      isEdit: widget.medicine != null,
      index: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.medicine != null;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            isEdit ? "Edit Medicine" : "Add Medicine",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions:
              isEdit
                  ? [
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: (){
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                    IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ConfirmDeleteDialog.show(
                        context: context,
                        index: widget.index!,
                      );
                    },
                  ),
                ]
              : null,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              AddPhotoAvatar(onTap: _pickImage, image: _pickedImage),
              const SizedBox(height: 10),
              TextFieldCustom(
                controller: medNameController,
                hintText: TextConstants.medicineName,
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                controller: chemNameController,
                hintText: TextConstants.chemicalName,
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                controller: dosageController,
                hintText: TextConstants.dosage,
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                controller: priceController,
                hintText: TextConstants.price,
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                controller: descController,
                hintText: TextConstants.description,
                maxlines: 5,
              ),
              const SizedBox(height: 10),
              Button(
                title: isEdit ? "Update" : "Submit",
                onPressed: _submitMedicine,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
