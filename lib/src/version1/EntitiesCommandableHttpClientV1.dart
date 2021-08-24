import 'dart:async';
import 'dart:convert';
import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import 'IEntitiesClient.dart';

class EntitiesCommandableHttpClientV1 extends CommandableHttpClient
    implements IEntitiesClientV1 {
  EntitiesCommandableHttpClientV1([config]) : super('v1/entities') {
    if (config != null) {
      configure(ConfigParams.fromValue(config));
    }
  }

  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var result = await callCommand(
      'get_entities',
      correlationId,
      {'filter': filter, 'paging': paging},
    );

    return DataPage<EntityV1>.fromJson(json.decode(result), (item) {
      var entity = EntityV1();
      entity.fromJson(item);
      return entity;
    });
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) async {
    var result = await callCommand(
        'get_entity_by_id', correlationId, {'entity_id': entityId});

    if (result == null) return null;

    var item = EntityV1();
    item.fromJson(json.decode(result));

    return item;
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) async {
    var result =
        await callCommand('get_entity_by_name', correlationId, {'name': name});

    if (result == null) return null;

    var item = EntityV1();
    item.fromJson(json.decode(result));

    return item;
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) async {
    var result =
        await callCommand('create_entity', correlationId, {'entity': entity});
    if (result == null) return null;

    var item = EntityV1();
    item.fromJson(json.decode(result));

    return item;
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) async {
    var result =
        await callCommand('update_entity', correlationId, {'entity': entity});

    if (result == null) return null;

    var item = EntityV1();
    item.fromJson(json.decode(result));

    return item;
  }

  @override
  Future<EntityV1> deleteEntityById(
      String correlationId, String entityId) async {
    var result = await callCommand(
        'delete_entity_by_id', correlationId, {'entity_id': entityId});

    if (result == null) return null;

    var item = EntityV1();
    item.fromJson(json.decode(result));

    return item;
  }
}
