// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class personalInfoDBAdapter extends TypeAdapter<personalInfoDB> {
  @override
  final int typeId = 2;

  @override
  personalInfoDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return personalInfoDB(
      status: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, personalInfoDB obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is personalInfoDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
