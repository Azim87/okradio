import 'package:hive/hive.dart';

part 'programs.g.dart';

@HiveType(typeId: 1)
class Programs extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  String? image;
  @HiveField(3)
  int? id;

  Programs({
    this.title,
    this.content,
    this.image,
    this.id,
  });

  factory Programs.fromJson(Map<String, dynamic> parsedJson) {
    return Programs(
        id: parsedJson['id'],
        title: parsedJson['title'].toString(),
        image: parsedJson['image'].toString(),
        content: parsedJson['content'].toString());
  }

  @override
  String toString() {
    return 'Programs(title: $title, content: $content,  image: $image, id: $id,)';
  }
}
