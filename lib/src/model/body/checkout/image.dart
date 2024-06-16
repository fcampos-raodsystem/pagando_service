class Image {
  Image({
    required this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['_id'].toString(),
    );
  }

  final String id;
}