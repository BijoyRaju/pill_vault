import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pill_vault/constants/image_constants.dart';
import 'package:pill_vault/constants/text_constants.dart';
import 'package:pill_vault/data/database.dart';
import 'package:pill_vault/views/home/widgets/medicine_card.dart';
import 'package:pill_vault/views/home/widgets/medicine_fav_card.dart';
import 'package:pill_vault/views/medicine_add/add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<Database> medicineBox;

  @override
  void initState() {
    super.initState();
    medicineBox = Hive.box<Database>('mybox');
  }

  @override
  Widget build(BuildContext context) {
    final allMedicines = medicineBox.values.toList();
    final recentMedicine = allMedicines.reversed.take(5).toList();
    final favoriteMedicine = allMedicines.where((m) => m.isFavorite == true).toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70)
                  ),
                ),
              ),
              ),
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                ImageConstants.homeBg,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(  
            child:  Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (recentMedicine.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: const Text(
                        TextConstants.recentlyAdded,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: recentMedicine.map((med) {
                            int index = allMedicines.indexOf(med);
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: MedicineCard(
                                  imagePath: med.imagePath != null 
                                      ? 'path_to_temp_file_written_from_memory_image' 
                                      : ImageConstants.medicineImg,
                                  medicineName: med.medicineName,
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => AddPage(
                                        medicine: med,
                                        index: index,)
                                        ));
                                  },
                                ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: const Text(
                      "Favorites",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (favoriteMedicine.isNotEmpty)
                    Column(
                      children: favoriteMedicine.map((med) {
                        int index = allMedicines.indexOf(med);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                          child: MedicineFavCard(
                            backgroundImage: ImageConstants.cardBg,
                            avatarImage: med.imagePath != null 
                                  ? 'path_to_temp_file_written_from_memory_image' 
                                  : ImageConstants.medicineImg,
                            medicineName: med.medicineName,
                            chemicalName: med.chemicalName,
                            description: med.description ?? 'No description available.',
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => AddPage(
                                  medicine: med,
                                  index: index,)
                                  ,));
                            },
                          ),
                        );
                      }).toList(),
                    )
                  else
                    const Text(TextConstants.noFavoriteMsg),
                ],
              ),
            ),
            ),
        ],
      ),
    );
  }
}
