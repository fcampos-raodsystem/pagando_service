class SecureImage {
  SecureImage({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.image,
  });

  factory SecureImage.fromJson(Map<String, dynamic> json) {
    return SecureImage(
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      image: json['image'] != null ? Image.fromJson(json['image'] as Map<String, dynamic>) : null,
    );
  }

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final Image? image;
}

class Image {
  Image({
    this.id,
    this.deletedAt,
    this.updatedAt,
    this.createdAt,
    this.name,
    this.size,
    this.mimeType,
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['_id'] as String?,
      deletedAt: json['deletedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      name: json['name'] as String?,
      size: json['size'] as int?,
      mimeType: json['mimeType'] as String?,
      url: json['url'] as String?,
    );
  }

  final String? id;
  final String? deletedAt;
  final String? updatedAt;
  final String? createdAt;
  final String? name;
  final int? size;
  final String? mimeType;
  final String? url;
}