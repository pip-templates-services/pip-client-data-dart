import 'dart:async';
import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'IEntitiesClient.dart';

class EntitiesNullClientV1 implements IEntitiesClientV1 {
  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) async {
    return DataPage<EntityV1>([], 0);
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) async {
    return null;
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) async {
    return null;
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) {
    return null;
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) {
    return null;
  }

  @override
  Future<EntityV1> deleteEntityById(String correlationId, String entityId) {
    return null;
  }
}
