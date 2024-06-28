class DniType {
  DniType({this.id, this.name, this.prefix, this.enable});

  DniType.fromJson(Map<String, dynamic> json) {
    id = json['_id'] == null ? '' : json['_id'].toString();
    name = json['name'] == null ? '' : json['name'].toString();
    prefix = json['prefix'] == null ? 'V' : json['prefix'].toString();
    enable = json['enable'] == null ? false : json['enable'] as bool;
  }

  String? id;

  String? name;

  String? prefix;

  bool? enable;
}
