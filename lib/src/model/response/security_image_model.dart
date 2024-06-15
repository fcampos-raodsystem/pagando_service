
/// A class that represents the response of the security image model.
class SecurityImageModel {
  /// Constructor for the security image model.
  SecurityImageModel({required this.message, required this.data});

  /// Factory method to create a security image model from a JSON object.
  factory SecurityImageModel.fromJson(Map<String, dynamic> json) {
    return SecurityImageModel(
      message: json['message'].toString(),
      data: (json['data'] as List).map((i) => SecurityImageData.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }

  /// [message] A message from the server.
  final String message;

  /// [data] A list of security image data.
  final List<SecurityImageData> data;
}

/// A class that represents the security image data.
class SecurityImageData {
  /// [id] The id of the security image.
  final String? id;

  /// [image] The image of the security image.
  final ImageData image;

  /// Constructor for the security image data.
  SecurityImageData({this.id, required this.image});

  /// Factory method to create a security image data from a JSON object.
  factory SecurityImageData.fromJson(Map<String, dynamic> json) {
    return SecurityImageData(
      id: json['_id'].toString(),
      image: json['image'] != null ? ImageData.fromJson(json['image']) : ImageData(url: ""),
    );
  }
}

/// A class that represents an image.
class ImageData {
  /// Constructor for the image.
  ImageData({required this.url});

  /// Factory method to create an image from a JSON object.
  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      url: json['url'].toString(),
    );
  }

  /// [url] The url of the image.
  final String? url;
}
