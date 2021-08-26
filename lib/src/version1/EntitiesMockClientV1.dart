import 'dart:async';
import 'dart:convert';

import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'EntityV1.dart';
import 'IEntitiesClient.dart';

class EntitiesMockClientV1 implements IEntitiesClientV1 {
  final int _maxPageSize = 100;
  List<EntityV1> _items = <EntityV1>[];

  EntitiesMockClientV1([List<EntityV1> items]) {
    if (items != null) _items = json.decode(json.encode(items));
  }

  Function compose_filter(FilterParams filter) {
    filter = filter ?? FilterParams();

    var id = filter.getAsNullableString('id');
    var siteId = filter.getAsNullableString('site_id');
    var type = filter.getAsNullableString('type');
    var name = filter.getAsNullableString('name');
    var names = filter.getAsObject('names');

    if (names is String) names = names.split(',');
    if (names is! List) names = null;

    return (item) {
      if (id != null && item.id != id) return false;
      if (siteId != null && item.site_id != siteId) return false;
      if (type != null && item.label != type) return false;
      if (name != null && item.udi != name) return false;
      if (names != null && names.indexOf(item.udi) < 0) return false;
      return true;
    };
  }

  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) {
    var filterBeacos = compose_filter(filter);
    var entities = _items.where((el) => filterBeacos(el)).toList();

    // Extract a page
    paging = paging ?? PagingParams();
    var skip = paging.getSkip(-1);
    var take = paging.getTake(_maxPageSize);
    var total;

    if (paging.total) total = entities.length;
    if (skip > 0) entities = entities.sublist(skip);

    entities = entities.take(take).toList();
    var page = DataPage<EntityV1>(entities, total);

    return Future<DataPage<EntityV1>>.value(page);
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) {
    var entities = _items.where((x) => x.id == entityId).toList();
    var entity = entities.isNotEmpty ? entities[0] : null;
    return Future<EntityV1>.value(entity);
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) {
    var entities = _items.where((x) => x.name == name).toList();
    var entity = entities.isNotEmpty ? entities[0] : null;
    return Future<EntityV1>.value(entity);
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) {
    if (entity == null) return null;
    entity = entity.clone();

    entity.id = entity.id ?? IdGenerator.nextLong();

    _items.add(entity);
    return Future<EntityV1>.value(entity);
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) {
    var index = _items.map((x) => x.id).toList().indexOf(entity.id);
    if (index < 0) return null;

    entity = entity.clone();
    _items[index] = entity;
    return Future<EntityV1>.value(entity);
  }

  @override
  Future<EntityV1> deleteEntityById(String correlationId, String entityId) {
    var index = _items.map((x) => x.id).toList().indexOf(entityId);
    var item = _items[index];
    if (index < 0) return null;
    _items.removeAt(index);
    return Future<EntityV1>.value(item);
  }
}
