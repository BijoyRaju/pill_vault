import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class Database extends HiveObject {
  @HiveField(0)
  String medicineName;

  @HiveField(1)
  String chemicalName;

  @HiveField(2)
  int dosage;

  @HiveField(3)
  int price;

  @HiveField(4)
  String? description;

  @HiveField(5)
  Uint8List? imagePath;

  @HiveField(6)
  bool? isFavorite;

  Database({
    required this.medicineName,
    required this.chemicalName,
    required this.dosage,
    required this.price,
    this.description,
    this.imagePath,
    this.isFavorite = false
  });
}
