// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArchiveAdapter extends TypeAdapter<Archive> {
  @override
  final int typeId = 0;

  @override
  Archive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Archive(
      title: fields[0] as String?,
      content: fields[1] as String?,
      dateTime: fields[2] as int?,
      image: fields[3] as String?,
      id: fields[4] as int?,
      audioId: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Archive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.audioId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArchiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
