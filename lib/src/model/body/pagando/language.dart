class Language {
  Language({this.key, this.value});

  Language.fromJson(Map<String, dynamic> json) {
    key = json['key'] != null ? json['key'].toString() : '';
    value = json['value'] != null ? json['value'].toString() : '';
  }

  String? key;

  String? value;
}
