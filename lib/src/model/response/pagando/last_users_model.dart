class LastUsersModel {
  final String message;
  final List<Children> data;

  LastUsersModel({required this.message, required this.data});

  factory LastUsersModel.fromJson(Map<String, dynamic> json) {
    return LastUsersModel(
      message: json['message']?.toString() ?? "",
      data: (json['data']['childrens'] as List).map((i) => Children.fromJson(i as Map<String, dynamic>)).toList(),
    );
  }
}

class Children {
  final String id;
  final String email;
  final String pin;
  final String phone;
  final DirectoryProfile profile;
  final DirectoryProfilePerson person;

  Children({required this.id, required this.email, required this.pin, required this.phone, required this.profile, required this.person});

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
      id: json['_id']?.toString() ?? "",
      email: json['email']?.toString() ?? "",
      pin: json['pin']?.toString() ?? "",
      phone: json['phone']?.toString() ?? "",
      profile: DirectoryProfile.fromJson(json['profile'] as Map<String, dynamic>),
      person: DirectoryProfilePerson.fromJson(json['person'] as Map<String, dynamic>),
    );
  }
}

class DirectoryProfile {
  final DirectoryProfileImage profileImage;

  DirectoryProfile({required this.profileImage});

  factory DirectoryProfile.fromJson(Map<String, dynamic> json) {
    return DirectoryProfile(
      profileImage: DirectoryProfileImage.fromJson(json['profileImage'] as Map<String, dynamic>),
    );
  }
}

class DirectoryProfileImage {
  final String url;

  DirectoryProfileImage({required this.url});

  factory DirectoryProfileImage.fromJson(Map<String, dynamic> json) {
    return DirectoryProfileImage(
      url: json['url']?.toString() ?? "",
    );
  }
}

class DirectoryProfilePerson {
  final String firstName;
  final String secondName;
  final String dni;

  final String dniType;

  DirectoryProfilePerson({required this.firstName, required this.dniType, required this.dni, required this.secondName});

  factory DirectoryProfilePerson.fromJson(Map<String, dynamic> json) {
    return DirectoryProfilePerson(
      firstName: json['firstName']?.toString() ?? "",
      secondName: json['secondName']?.toString() ?? "",
      dni: json['dni']?.toString() ?? "",
      dniType: json['dniType']['prefix']?.toString() ?? "",
    );
  }
}
