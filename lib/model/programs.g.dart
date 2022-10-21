// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgramsAdapter extends TypeAdapter<Programs> {
  @override
  final int typeId = 1;

  @override
  Programs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Programs(
      title: fields[0] as String?,
      content: fields[1] as String?,
      image: fields[2] as String?,
      id: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Programs obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgramsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
