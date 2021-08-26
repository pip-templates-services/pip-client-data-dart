import 'dart:async';

import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_grpc/pip_services3_grpc.dart';

import 'EntityV1.dart';
import 'IEntitiesClient.dart';

class EntitiesCommandableGrpcClientV1 extends CommandableGrpcClient
    implements IEntitiesClientV1 {
  EntitiesCommandableGrpcClientV1([ConfigParams config])
      : super('v1.entities') {
    if (config != null) {
      configure(ConfigParams.fromValue(config));
    }
  }

  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var response = await callCommand(
        'get_entities', correlationId, {'filter': filter, 'paging': paging});

    if (response == null) {
      return null;
    }

    return DataPage<EntityV1>.fromJson(response, (item) {
      var entity = EntityV1();
      entity.fromJson(item);
      return entity;
    });
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) async {
    var response = await callCommand(
        'get_entity_by_id', correlationId, {'entity_id': entityId});

    if (response == null) return null;

    var item = EntityV1();
    item.fromJson(response);
    return item;
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) async {
    var response =
        await callCommand('get_entity_by_name', correlationId, {'name': name});

    if (response == null) return null;

    var item = EntityV1();
    item.fromJson(response);

    return item;
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) async {
    var response =
        await callCommand('create_entity', correlationId, {'entity': entity});

    if (response == null) return null;

    var item = EntityV1();
    item.fromJson(response);

    return item;
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) async {
    var response =
        await callCommand('update_entity', correlationId, {'entity': entity});

    if (response == null) return null;

    var item = EntityV1();
    item.fromJson(response);

    return item;
  }

  @override
  Future<EntityV1> deleteEntityById(
      String correlationId, String entityId) async {
    var response = await callCommand(
        'delete_entity_by_id', correlationId, {'entity_id': entityId});

    if (response == null) return null;

    var item = EntityV1();
    item.fromJson(response);

    return item;
  }
}
