import 'dart:async';

import 'package:pip_client_data_dart/src/generated/entities_v1.pb.dart'
    as messages;
import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_grpc/pip_services3_grpc.dart';

import 'EntitiesGrpcConverterV1.dart';

import 'IEntitiesClient.dart';

class EntitiesGrpcClientV1 extends GrpcClient implements IEntitiesClientV1 {
  EntitiesGrpcClientV1() : super('entities_v1.Entities');

  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var request = messages.EntitiesPageRequest();

    request.filter.addAll(filter.innerValue());
    request.paging = EntitiesGrpcConverterV1.fromPagingParams(paging);

    var timing = instrument(correlationId, 'v1.entities.get_entities');
    try {
      var response =
          await call<messages.EntitiesPageRequest, messages.EntitiesPageReply>(
              'get_entities', correlationId, request);

      return response != null
          ? EntitiesGrpcConverterV1.toEntitiesPage(response.page)
          : null;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) async {
    var request = messages.EntityIdRequest();
    request.entityId = entityId;

    var timing = instrument(correlationId, 'v1.entities.get_entity_by_id');
    try {
      var response = await call<messages.EntityIdRequest, messages.EntityReply>(
          'get_entity_by_id', correlationId, request);

      if (response != null &&
          response.entity.id == '' &&
          response.entity.siteId == '' &&
          response.entity.name == '') {
        return null;
      }
      return response != null
          ? EntitiesGrpcConverterV1.toEntity(response.entity)
          : null;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) async {
    var request = messages.EntityNameRequest();
    request.name = name;

    var timing = instrument(correlationId, 'v1.entities.get_entity_by_udi');

    try {
      var response =
          await call<messages.EntityNameRequest, messages.EntityReply>(
              'get_entity_by_name', correlationId, request);

      if (response != null &&
          response.entity.id == '' &&
          response.entity.siteId == '' &&
          response.entity.name == '') {
        return null;
      }

      return response != null
          ? EntitiesGrpcConverterV1.toEntity(response.entity)
          : null;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) async {
    var request = messages.EntityRequest();
    request.entity = EntitiesGrpcConverterV1.fromEntity(entity);

    var timing = instrument(correlationId, 'v1.entities.create_entity');
    try {
      var response = await call<messages.EntityRequest, messages.EntityReply>(
          'create_entity', correlationId, request);

      if (response != null &&
          response.entity.id == '' &&
          response.entity.siteId == '' &&
          response.entity.name == '') {
        return null;
      }
      return response != null
          ? EntitiesGrpcConverterV1.toEntity(response.entity)
          : null;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) async {
    var request = messages.EntityRequest();
    request.entity = EntitiesGrpcConverterV1.fromEntity(entity);

    var timing = instrument(correlationId, 'v1.entities.update_entity');

    try {
      var response = await call<messages.EntityRequest, messages.EntityReply>(
          'update_entity', correlationId, request);

      if (response != null &&
          response.entity.id == '' &&
          response.entity.siteId == '' &&
          response.entity.name == '') {
        return null;
      }
      return response != null
          ? EntitiesGrpcConverterV1.toEntity(response.entity)
          : null;
    } finally {
      timing.endTiming();
    }
  }

  @override
  Future<EntityV1> deleteEntityById(
      String correlationId, String entityId) async {
    var request = messages.EntityIdRequest();
    request.entityId = entityId;

    var timing = instrument(correlationId, 'v1.entities.delete_entity_by_id');
    try {
      var response = await call<messages.EntityIdRequest, messages.EntityReply>(
          'delete_entity_by_id', correlationId, request);

      if (response != null &&
          response.entity.id == '' &&
          response.entity.siteId == '' &&
          response.entity.name == '') {
        return null;
      }
      return response != null
          ? EntitiesGrpcConverterV1.toEntity(response.entity)
          : null;
    } finally {
      timing.endTiming();
    }
  }
}
