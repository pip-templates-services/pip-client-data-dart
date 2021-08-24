import 'dart:async';

import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

abstract class IEntitiesClientV1 {
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging);

  Future<EntityV1> getEntityById(String correlationId, String entityId);

  Future<EntityV1> getEntityByName(String correlationId, String entityId);

  Future<EntityV1> createEntity(String correlationId, EntityV1 entity);

  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity);

  Future<EntityV1> deleteEntityById(String correlationId, String entityId);
}
