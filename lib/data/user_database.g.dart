// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDatabaseAdapter extends TypeAdapter<UserDatabase> {
  @override
  final int typeId = 1;

  @override
  UserDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDatabase(
      fullName: fields[0] as String,
      email: fields[1] as String,
      phoneNumber: fields[2] as String,
      password: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDatabase obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
