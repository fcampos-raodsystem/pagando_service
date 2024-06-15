class Profile {
  Profile({this.id, this.securityKey = '', this.profileImage});

  /// {{@template profile}}
  /// Data class for profile
  /// [json] is the dynamic data from the API
  /// {{@endtemplate}}
  Profile.fromJson(Map<String, dynamic> json) {
    id = json['_id'] != null ? json['_id'].toString() : '';
    securityKey = json['securityKey'] != null ? json['securityKey'].toString() : '';
    profileImage = json['profileImage'] != null ? ProfileImage.fromJson(json['profileImage']) : ProfileImage(url: "");
  }

  /// [id] is the id of the profile
  String? id;

  /// [securityKey] is the security key of the profile
  String? securityKey;

  /// [profileImage] is the image of the profile
  ProfileImage? profileImage;
}

/// {{@template profile_image}}
/// Data class for profile image
/// {{@endtemplate}}
class ProfileImage {
  /// {{@template profile_image}}
  /// Data class for profile image
  /// {{@endtemplate}}
  ProfileImage({
    this.id,
    this.deletedAt,
    this.updatedAt,
    this.createdAt,
    this.name,
    this.size,
    this.mimeType,
    this.url,
  });

  /// {{@template profile_image}}
  /// Data class for profile image
  /// [json] is the dynamic data from the API
  /// {{@endtemplate}}
  ProfileImage.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'].toString() : '';
    deletedAt = json['deletedAt'] != null ? json['deletedAt'].toString() : '';
    updatedAt = json['updatedAt'] != null ? json['updatedAt'].toString() : '';
    createdAt = json['createdAt'] != null ? json['createdAt'].toString() : '';
    name = json['name'] != null ? json['name'].toString() : '';
    size = json['size'] != null ? json['size'].toString() : '';
    mimeType = json['mimeType'] != null ? json['mimeType'].toString() : '';
    url = json['url'] != null ? json['url'].toString() : '';
  }

  /// [id] is the id of the image
  String? id;

  /// [deletedAt] is the date the image was deleted
  String? deletedAt;

  /// [updatedAt] is the date the image was last updated
  String? updatedAt;

  /// [createdAt] is the date the image was created
  String? createdAt;

  /// [name] is the name of the image
  String? name;

  /// [size] is the size of the image
  String? size;

  /// [mimeType] is the type of the image
  String? mimeType;

  /// [url] is the url of the image
  String? url;
}
