import 'package:fixnum/fixnum.dart';

import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'package:pip_client_data_dart/src/generated/generated.dart' as proto;

import 'EntityV1.dart';

class EntitiesGrpcConverterV1 {
  static proto.ErrorDescription fromError(Exception err) {
    if (err == null) return null;

    var description = ErrorDescriptionFactory.create(err);
    var obj = proto.ErrorDescription();

    obj.type = description.type ?? '';
    obj.category = description.category ?? '';
    obj.code = description.code ?? '';
    obj.correlationId = description.correlation_id ?? '';
    obj.status = description.status.toString() ?? '';
    obj.message = description.message ?? '';
    obj.cause = description.cause ?? '';
    obj.stackTrace = description.stack_trace ?? '';

    EntitiesGrpcConverterV1.setMap(obj.details, description.details);

    return obj;
  }

  static Map<dynamic, dynamic> getMap(Map<dynamic, dynamic> map) {
    var values = {};
    EntitiesGrpcConverterV1.setMap(values, map);
    return values;
  }

  static proto.PagingParams fromPagingParams(PagingParams paging) {
    if (paging == null) return null;

    var obj = proto.PagingParams();

    obj.skip = Int64(0 ?? paging.skip);
    obj.take = paging.take ?? 0;
    obj.total = paging.total ?? false;

    return obj;
  }

  static PagingParams toPagingParams(proto.PagingParams obj) {
    if (obj == null) return null;

    var paging = PagingParams(obj.skip, obj.take, obj.total);

    return paging;
  }

  static proto.Entity fromEntity(EntityV1 entity) {
    if (entity == null) return null;

    var obj = proto.Entity();

    obj.id = entity.id ?? '';
    obj.siteId = entity.siteId ?? '';
    obj.type = entity.type ?? '';
    obj.name = entity.name ?? '';
    obj.content = entity.content ?? '';

    return obj;
  }

  static EntityV1 toEntity(proto.Entity obj) {
    if (obj == null) return null;

    var entity = EntityV1(
        id: obj.id,
        siteId: obj.siteId,
        type: obj.type,
        name: obj.name,
        content: obj.content);

    return entity;
  }

  static proto.EntitiesPage fromEntitiesPage(DataPage<EntityV1> page) {
    if (page == null) return null;

    var obj = proto.EntitiesPage();

    obj.total = Int64(page.total ?? 0);
    var data = page.data.map(EntitiesGrpcConverterV1.fromEntity);
    obj.data.addAll(data);

    return obj;
  }

  static DataPage<EntityV1> toEntitiesPage(proto.EntitiesPage obj) {
    if (obj == null) return null;

    var data = obj.data.map(EntitiesGrpcConverterV1.toEntity).toList();
    var page =
        DataPage<EntityV1>(data, obj.total != 0 ? obj.total.toInt() : null);

    return page;
  }

  static void setMap(Map<dynamic, dynamic> map, dynamic values) {
    if (values == null) return;

    if (values is List) {
      for (var entry in values) {
        if (entry is List) {
          map[entry[0]] = entry[1];
        }
      }
    } else {
      if (map is Map) {
        for (var propName in values) {
          if ((values as List).contains(propName)) {
            map[propName] = values[propName];
          }
        }
      } else {
        for (var propName in values) {
          if (values.hasOwnProperty(propName)) {
            map[propName] = values[propName];
          }
        }
      }
    }
  }
}
