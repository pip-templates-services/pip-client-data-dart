import 'package:pip_services3_commons/pip_services3_commons.dart';

class EntityV1Schema extends ObjectSchema {
  EntityV1Schema() : super() {
    withOptionalProperty('id', TypeCode.String);
    withRequiredProperty('site_id', TypeCode.String);
    withOptionalProperty('type', TypeCode.String);
    withOptionalProperty('name', TypeCode.String);
    withOptionalProperty('content', TypeCode.String);
  }
}
