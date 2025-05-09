// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseAdapter extends TypeAdapter<Database> {
  @override
  final int typeId = 0;

  @override
  Database read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Database(
      medicineName: fields[0] as String,
      chemicalName: fields[1] as String,
      dosage: fields[2] as int,
      price: fields[3] as int,
      description: fields[4] as String?,
      imagePath: fields[5] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, Database obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.medicineName)
      ..writeByte(1)
      ..write(obj.chemicalName)
      ..writeByte(2)
      ..write(obj.dosage)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
