import 'dart:async';

import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import 'IEntitiesClient.dart';

class EntitiesDirectClientV1 extends DirectClient<IEntitiesController>
    implements IEntitiesClientV1 {
  EntitiesDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-service-data', 'controller', '*', '*', '1.0'));
  }

  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = instrument(correlationId, 'entities.get_entities');
    try {
      var page = await controller.getEntities(correlationId, filter, paging);
      return page;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) async {
    var timing = instrument(correlationId, 'entities.get_entity_by_id');

    try {
      var entity = await controller.getEntityById(correlationId, entityId);
      return entity;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) async {
    var timing = instrument(correlationId, 'entities.get_entity_by_name');
    try {
      var entity = await controller.getEntityByName(correlationId, name);
      return entity;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) async {
    var timing = instrument(correlationId, 'entities.create_entity');

    try {
      var result = await controller.createEntity(correlationId, entity);
      return result;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) async {
    var timing = instrument(correlationId, 'entities.update_entity');

    try {
      var result = await controller.updateEntity(correlationId, entity);
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
      var entity = await controller.deleteEntityById(correlationId, entityId);
      return entity;
    } finally {
      timing.endTiming();
    }
  }
}
