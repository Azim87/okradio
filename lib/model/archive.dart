import 'package:hive/hive.dart';

part 'archive.g.dart';

@HiveType(typeId: 0)
class Archive extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  int? dateTime;
  @HiveField(3)
  String? image;
  @HiveField(4)
  int? id;
  @HiveField(5)
  int? audioId;

  Archive({
    this.title,
    this.content,
    this.dateTime,
    this.image,
    this.id,
    this.audioId,
  });

  factory Archive.fromJson(Map<String, dynamic> parsedJson) {
    return Archive(
        id: parsedJson['id'],
        title: parsedJson['title'].toString(),
        image: parsedJson['image'].toString(),
        content: parsedJson['content'].toString());
  }

  @override
  String toString() {
    return 'Archive(title: $title, content: $content, dateTime: $dateTime, image: $image, id: $id, audioId: $audioId)';
  }
}
