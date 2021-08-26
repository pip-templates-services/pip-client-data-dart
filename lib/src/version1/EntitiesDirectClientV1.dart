import 'dart:async';

import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import 'package:pip_service_data_dart/src/data/version1/EntityV1.dart'
    as service_entity;
import 'EntityV1.dart';
import 'IEntitiesClient.dart';

class EntitiesDirectClientV1 extends DirectClient<dynamic>
    implements IEntitiesClientV1 {
  EntitiesDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-service-data', 'controller', '*', '*', '1.0'));
  }

  service_entity.EntityV1 toServiceEntity(EntityV1 entity) {
    // convert entity to service entity type
    if (entity == null) return null;
    return service_entity.EntityV1().fromJson(entity.toJson());
  }

  EntityV1 fromServiceEntity(service_entity.EntityV1 entity) {
    // convert entity to service entity type
    if (entity == null) return null;
    return EntityV1().fromJson(entity.toJson());
  }

  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = instrument(correlationId, 'entities.get_entities');
    try {
      DataPage<service_entity.EntityV1> servicePage =
          await controller.getEntities(correlationId, filter, paging);

      var page = DataPage<EntityV1>(<EntityV1>[], servicePage.total);

      servicePage.data.forEach((item) {
        page.data.add(fromServiceEntity(item));
      });

      return page;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) async {
    var timing = instrument(correlationId, 'entities.get_entity_by_id');

    try {
      var entity = fromServiceEntity(
          await controller.getEntityById(correlationId, entityId));
      return entity;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) async {
    var timing = instrument(correlationId, 'entities.get_entity_by_name');
    try {
      var entity = fromServiceEntity(
          await controller.getEntityByName(correlationId, name));
      return entity;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) async {
    var timing = instrument(correlationId, 'entities.create_entity');

    try {
      var result = fromServiceEntity(await controller.createEntity(
          correlationId, toServiceEntity(entity)));

      return result;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) async {
    var timing = instrument(correlationId, 'entities.update_entity');

    try {
      var result = fromServiceEntity(await controller.updateEntity(
          correlationId, toServiceEntity(entity)));
      return result;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> deleteEntityById(
      String correlationId, String entityId) async {
    var timing = instrument(correlationId, 'entities.delete_entity_by_id');

    try {
      var entity = fromServiceEntity(
          await controller.deleteEntityById(correlationId, entityId));
      return entity;
    } finally {
      timing.endTiming();
    }
  }
}
