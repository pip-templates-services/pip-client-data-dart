import 'dart:async';
import 'dart:convert';

import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_commons/src/data/PagingParams.dart';
import 'package:pip_services3_commons/src/data/FilterParams.dart';
import 'package:pip_services3_commons/src/data/DataPage.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import 'IEntitiesClient.dart';

class EntitiesRestClientV1 extends RestClient implements IEntitiesClientV1 {
  EntitiesRestClientV1([config]) : super() {
    baseRoute = 'v1/entities';
    if (config != null) {
      configure(ConfigParams.fromValue(config));
    }
  }

  @override
  void configure(ConfigParams config) {
    super.configure(config);
  }

  @override
  Future<DataPage<EntityV1>> getEntities(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var time = instrument(correlationId, 'v1/entities.get_entities');

    var params = {'filter': filter.toString(), 'paging': paging.toString()};

    try {
      var response =
          json.decode(await call('get', '/entities', correlationId, params));

      var dataPage = DataPage<EntityV1>(
          response['data']
              .map<EntityV1>((f) => EntityV1().fromJson(f))
              .toList(),
          response['total']);

      return dataPage;
    } finally {
      time.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityById(String correlationId, String entityId) async {
    var time = instrument(correlationId, 'v1/entities.get_entity_by_id');
    try {
      var response =
          await call('get', '/entities/$entityId', correlationId, null);

      if (response != null) {
        var entity = EntityV1().fromJson(json.decode(response));
        return entity;
      }
      return null;
    } finally {
      time.endTiming();
    }
  }

  @override
  Future<EntityV1> getEntityByName(String correlationId, String name) async {
    var time = instrument(correlationId, 'v1/entities.get_entity_by_name');
    try {
      var response =
          await call('get', '/entities/name/$name', correlationId, null);

      if (response != null) {
        var entity = EntityV1().fromJson(json.decode(response));
        return entity;
      }
      return null;
    } finally {
      time.endTiming();
    }
  }

  @override
  Future<EntityV1> createEntity(String correlationId, EntityV1 entity) async {
    var time = instrument(correlationId, 'v1/entities.create_entity');
    try {
      var response = await call(
          'post', '/entities', correlationId, null, {'entity': entity});
      if (response != null) {
        var entity = EntityV1().fromJson(json.decode(response));
        return entity;
      }
      return null;
    } finally {
      time.endTiming();
    }
  }

  @override
  Future<EntityV1> updateEntity(String correlationId, EntityV1 entity) async {
    var time = instrument(correlationId, 'v1/entities.update_entity');
    try {
      var response = await call(
          'put', '/entities', correlationId, null, {'entity': entity});
      if (response != null) {
        var entity = EntityV1().fromJson(json.decode(response));
        return entity;
      }
      return null;
    } finally {
      time.endTiming();
    }
  }

  @override
  Future<EntityV1> deleteEntityById(
      String correlationId, String entityId) async {
    var time = instrument(correlationId, 'v1/entities.delete_entity_by_id');
    try {
      var response =
          await call('delete', '/entities/$entityId', correlationId, null);
      if (response != null) {
        var entity = EntityV1().fromJson(json.decode(response));
        return entity;
      }
      return null;
    } finally {
      time.endTiming();
    }
  }
}
