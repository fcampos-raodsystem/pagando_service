class Profile {
  final ProfileImage profileImage;

  Profile({required this.profileImage});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      profileImage: ProfileImage.fromJson(json['profileImage']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileImage': profileImage.toJson(),
    };
  }
}

class ProfileImage {
  final String url;

  ProfileImage({required this.url});

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
