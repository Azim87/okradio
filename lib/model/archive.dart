class Archive {
  final String? title;
  final String? content;
  final int? dateTime;
  final String? image;
  final int? id;
  final int? audioId;

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
