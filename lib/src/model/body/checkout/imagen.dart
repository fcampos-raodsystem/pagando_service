class Imagen {
  Imagen({
    required this.url,
  });

  factory Imagen.fromJson(Map<String, dynamic> json) {
    return Imagen(
      url: json['url'],
    );
  }

  final String url;
}
