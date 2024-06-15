/// Language model
class Language {
  /// Language constructor
  Language({this.key, this.value});

  /// Language from json
  Language.fromJson(Map<String, dynamic> json) {
    key = json['key'] != null ? json['key'].toString() : '';
    value = json['value'] != null ? json['value'].toString() : '';
  }

  /// Language key
  String? key;

  /// Language value
  String? value;
}
