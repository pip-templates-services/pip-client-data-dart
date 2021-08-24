///
//  Generated code. Do not modify.
//  source: entities_v1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'entities_v1.pb.dart' as $0;
export 'entities_v1.pb.dart';

class EntitiesClient extends $grpc.Client {
  static final _$get_entities =
      $grpc.ClientMethod<$0.EntitiesPageRequest, $0.EntitiesPageReply>(
          '/entities_v1.Entities/get_entities',
          ($0.EntitiesPageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.EntitiesPageReply.fromBuffer(value));
  static final _$get_entity_by_id =
      $grpc.ClientMethod<$0.EntityIdRequest, $0.EntityReply>(
          '/entities_v1.Entities/get_entity_by_id',
          ($0.EntityIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EntityReply.fromBuffer(value));
  static final _$get_entity_by_name =
      $grpc.ClientMethod<$0.EntityNameRequest, $0.EntityReply>(
          '/entities_v1.Entities/get_entity_by_name',
          ($0.EntityNameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EntityReply.fromBuffer(value));
  static final _$create_entity =
      $grpc.ClientMethod<$0.EntityRequest, $0.EntityReply>(
          '/entities_v1.Entities/create_entity',
          ($0.EntityRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EntityReply.fromBuffer(value));
  static final _$update_entity =
      $grpc.ClientMethod<$0.EntityRequest, $0.EntityReply>(
          '/entities_v1.Entities/update_entity',
          ($0.EntityRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EntityReply.fromBuffer(value));
  static final _$delete_entity_by_id =
      $grpc.ClientMethod<$0.EntityIdRequest, $0.EntityReply>(
          '/entities_v1.Entities/delete_entity_by_id',
          ($0.EntityIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EntityReply.fromBuffer(value));

  EntitiesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.EntitiesPageReply> get_entities(
      $0.EntitiesPageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_entities, request, options: options);
  }

  $grpc.ResponseFuture<$0.EntityReply> get_entity_by_id(
      $0.EntityIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_entity_by_id, request, options: options);
  }

  $grpc.ResponseFuture<$0.EntityReply> get_entity_by_name(
      $0.EntityNameRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_entity_by_name, request, options: options);
  }

  $grpc.ResponseFuture<$0.EntityReply> create_entity($0.EntityRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_entity, request, options: options);
  }

  $grpc.ResponseFuture<$0.EntityReply> update_entity($0.EntityRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_entity, request, options: options);
  }

  $grpc.ResponseFuture<$0.EntityReply> delete_entity_by_id(
      $0.EntityIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_entity_by_id, request, options: options);
  }
}

abstract class EntitiesServiceBase extends $grpc.Service {
  $core.String get $name => 'entities_v1.Entities';

  EntitiesServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.EntitiesPageRequest, $0.EntitiesPageReply>(
            'get_entities',
            get_entities_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.EntitiesPageRequest.fromBuffer(value),
            ($0.EntitiesPageReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EntityIdRequest, $0.EntityReply>(
        'get_entity_by_id',
        get_entity_by_id_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EntityIdRequest.fromBuffer(value),
        ($0.EntityReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EntityNameRequest, $0.EntityReply>(
        'get_entity_by_name',
        get_entity_by_name_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EntityNameRequest.fromBuffer(value),
        ($0.EntityReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EntityRequest, $0.EntityReply>(
        'create_entity',
        create_entity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EntityRequest.fromBuffer(value),
        ($0.EntityReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EntityRequest, $0.EntityReply>(
        'update_entity',
        update_entity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EntityRequest.fromBuffer(value),
        ($0.EntityReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EntityIdRequest, $0.EntityReply>(
        'delete_entity_by_id',
        delete_entity_by_id_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EntityIdRequest.fromBuffer(value),
        ($0.EntityReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.EntitiesPageReply> get_entities_Pre($grpc.ServiceCall call,
      $async.Future<$0.EntitiesPageRequest> request) async {
    return get_entities(call, await request);
  }

  $async.Future<$0.EntityReply> get_entity_by_id_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EntityIdRequest> request) async {
    return get_entity_by_id(call, await request);
  }

  $async.Future<$0.EntityReply> get_entity_by_name_Pre($grpc.ServiceCall call,
      $async.Future<$0.EntityNameRequest> request) async {
    return get_entity_by_name(call, await request);
  }

  $async.Future<$0.EntityReply> create_entity_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EntityRequest> request) async {
    return create_entity(call, await request);
  }

  $async.Future<$0.EntityReply> update_entity_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EntityRequest> request) async {
    return update_entity(call, await request);
  }

  $async.Future<$0.EntityReply> delete_entity_by_id_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EntityIdRequest> request) async {
    return delete_entity_by_id(call, await request);
  }

  $async.Future<$0.EntitiesPageReply> get_entities(
      $grpc.ServiceCall call, $0.EntitiesPageRequest request);
  $async.Future<$0.EntityReply> get_entity_by_id(
      $grpc.ServiceCall call, $0.EntityIdRequest request);
  $async.Future<$0.EntityReply> get_entity_by_name(
      $grpc.ServiceCall call, $0.EntityNameRequest request);
  $async.Future<$0.EntityReply> create_entity(
      $grpc.ServiceCall call, $0.EntityRequest request);
  $async.Future<$0.EntityReply> update_entity(
      $grpc.ServiceCall call, $0.EntityRequest request);
  $async.Future<$0.EntityReply> delete_entity_by_id(
      $grpc.ServiceCall call, $0.EntityIdRequest request);
}
