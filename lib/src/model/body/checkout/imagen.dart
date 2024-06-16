class Imagen {
  Imagen({
    required this.id,
  });

  factory Imagen.fromJson(Map<String, dynamic> json) {
    return Imagen(
      id: json['_id'].toString(),
    );
  }

  final String id;
}