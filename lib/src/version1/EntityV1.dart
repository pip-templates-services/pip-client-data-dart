import 'package:pip_services3_commons/pip_services3_commons.dart';

class EntityV1 implements IStringIdentifiable, ICloneable {
  @override
  String id;
  String siteId;
  String type;
  String name;
  String content;

  EntityV1({String id, String siteId, String type, String name, String content})
      : id = id,
        siteId = siteId,
        type = type,
        name = name,
        content = content;

  EntityV1 fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    type = json['type'];
    name = json['name'];
    content = json['content'];

    return this;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'site_id': siteId,
      'type': type,
      'name': name,
      'content': content,
    };
  }

  @override
  EntityV1 clone() {
    return EntityV1(
        id: id, siteId: siteId, type: type, name: name, content: content);
  }
}
