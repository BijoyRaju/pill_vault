import 'package:flutter/material.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/data/database.dart';
import 'package:pill_vault/views/medicine_add/add_page.dart';
import 'package:pill_vault/widgets/text_field.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/views/home/widgets/medicine_fav_card.dart';
import 'package:hive/hive.dart';

class ListViewPage extends StatefulWidget {
  
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Database> _medicines = [];
  List<Database> _filtered = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    _loadMedicines();
    _searchController.addListener(_filteredMedicine);
    super.initState();
  }

  void _loadMedicines() async {
    final box = await Hive.openBox<Database>('mybox');
    final items = box.values.toList();
    setState(() {
      _medicines = items;
      _filtered = items;
    });
  }

  void _filteredMedicine() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered =
          _medicines.where((med) {
            return med.medicineName.toLowerCase().contains(query) ||
                med.chemicalName.toLowerCase().contains(query) ||
                med.dosage.toString().contains(query);
          }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 12),
              TextFieldCustom(
                controller: _searchController,
                hintText: "Search Medicine...",
              ),
              SizedBox(width: 20),
              Expanded(
                child:
                    _filtered.isEmpty
                        ? const Center(child: Text(TextConstants.noResultMsg))
                        : ListView.builder(
                          itemCount: _filtered.length,
                          itemBuilder: (context, index) {
                            final med = _filtered[index];
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: MedicineFavCard(
                                backgroundImage: ImageConstants.cardBg,
                                avatarImage: ImageConstants.medcineImgRound,
                                medicineName: med.medicineName,
                                chemicalName: med.chemicalName,
                                description:
                                    med.description ?? "No Description Added",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => AddPage(
                                            medicine: med,
                                            index: index,
                                          ),
                                    ),
                                  ).then((_) => _loadMedicines());
                                },
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
