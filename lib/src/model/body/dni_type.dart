/// DniType model
class DniType {
  /// Constructor
  DniType({this.id, this.name, this.prefix, this.enable});

  /// Constructor from json
  DniType.fromJson(Map<String, dynamic> json) {
    id = json['_id'] == null ? '' : json['_id'].toString();
    name = json['name'] == null ? '' : json['name'].toString();
    prefix = json['prefix'] == null ? 'V' : json['prefix'].toString();
    enable = json['enable'] == null ? false : json['enable'] as bool;
  }

  /// [id] is the unique identifier of the DniType
  String? id;

  /// [name] is the name of the DniType
  String? name;

  /// [prefix] is the prefix of the DniType
  String? prefix;

  /// [enable] is the enable of the DniType
  bool? enable;
}
