///
//  Generated code. Do not modify.
//  source: entities_v1.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use errorDescriptionDescriptor instead')
const ErrorDescription$json = const {
  '1': 'ErrorDescription',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'category', '3': 2, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'correlation_id', '3': 4, '4': 1, '5': 9, '10': 'correlationId'},
    const {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'message', '3': 6, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'cause', '3': 7, '4': 1, '5': 9, '10': 'cause'},
    const {'1': 'stack_trace', '3': 8, '4': 1, '5': 9, '10': 'stackTrace'},
    const {'1': 'details', '3': 9, '4': 3, '5': 11, '6': '.entities_v1.ErrorDescription.DetailsEntry', '10': 'details'},
  ],
  '3': const [ErrorDescription_DetailsEntry$json],
};

@$core.Deprecated('Use errorDescriptionDescriptor instead')
const ErrorDescription_DetailsEntry$json = const {
  '1': 'DetailsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ErrorDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptionDescriptor = $convert.base64Decode('ChBFcnJvckRlc2NyaXB0aW9uEhIKBHR5cGUYASABKAlSBHR5cGUSGgoIY2F0ZWdvcnkYAiABKAlSCGNhdGVnb3J5EhIKBGNvZGUYAyABKAlSBGNvZGUSJQoOY29ycmVsYXRpb25faWQYBCABKAlSDWNvcnJlbGF0aW9uSWQSFgoGc3RhdHVzGAUgASgJUgZzdGF0dXMSGAoHbWVzc2FnZRgGIAEoCVIHbWVzc2FnZRIUCgVjYXVzZRgHIAEoCVIFY2F1c2USHwoLc3RhY2tfdHJhY2UYCCABKAlSCnN0YWNrVHJhY2USRAoHZGV0YWlscxgJIAMoCzIqLmVudGl0aWVzX3YxLkVycm9yRGVzY3JpcHRpb24uRGV0YWlsc0VudHJ5UgdkZXRhaWxzGjoKDERldGFpbHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use pagingParamsDescriptor instead')
const PagingParams$json = const {
  '1': 'PagingParams',
  '2': const [
    const {'1': 'skip', '3': 1, '4': 1, '5': 3, '10': 'skip'},
    const {'1': 'take', '3': 2, '4': 1, '5': 5, '10': 'take'},
    const {'1': 'total', '3': 3, '4': 1, '5': 8, '10': 'total'},
  ],
};

/// Descriptor for `PagingParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pagingParamsDescriptor = $convert.base64Decode('CgxQYWdpbmdQYXJhbXMSEgoEc2tpcBgBIAEoA1IEc2tpcBISCgR0YWtlGAIgASgFUgR0YWtlEhQKBXRvdGFsGAMgASgIUgV0b3RhbA==');
@$core.Deprecated('Use entityDescriptor instead')
const Entity$json = const {
  '1': 'Entity',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'site_id', '3': 2, '4': 1, '5': 9, '10': 'siteId'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `Entity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityDescriptor = $convert.base64Decode('CgZFbnRpdHkSDgoCaWQYASABKAlSAmlkEhcKB3NpdGVfaWQYAiABKAlSBnNpdGVJZBISCgR0eXBlGAMgASgJUgR0eXBlEhIKBG5hbWUYBCABKAlSBG5hbWUSGAoHY29udGVudBgFIAEoCVIHY29udGVudA==');
@$core.Deprecated('Use entitiesPageDescriptor instead')
const EntitiesPage$json = const {
  '1': 'EntitiesPage',
  '2': const [
    const {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    const {'1': 'data', '3': 2, '4': 3, '5': 11, '6': '.entities_v1.Entity', '10': 'data'},
  ],
};

/// Descriptor for `EntitiesPage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entitiesPageDescriptor = $convert.base64Decode('CgxFbnRpdGllc1BhZ2USFAoFdG90YWwYASABKANSBXRvdGFsEicKBGRhdGEYAiADKAsyEy5lbnRpdGllc192MS5FbnRpdHlSBGRhdGE=');
@$core.Deprecated('Use entitiesPageRequestDescriptor instead')
const EntitiesPageRequest$json = const {
  '1': 'EntitiesPageRequest',
  '2': const [
    const {'1': 'correlation_id', '3': 1, '4': 1, '5': 9, '10': 'correlationId'},
    const {'1': 'filter', '3': 2, '4': 3, '5': 11, '6': '.entities_v1.EntitiesPageRequest.FilterEntry', '10': 'filter'},
    const {'1': 'paging', '3': 3, '4': 1, '5': 11, '6': '.entities_v1.PagingParams', '10': 'paging'},
  ],
  '3': const [EntitiesPageRequest_FilterEntry$json],
};

@$core.Deprecated('Use entitiesPageRequestDescriptor instead')
const EntitiesPageRequest_FilterEntry$json = const {
  '1': 'FilterEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `EntitiesPageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entitiesPageRequestDescriptor = $convert.base64Decode('ChNFbnRpdGllc1BhZ2VSZXF1ZXN0EiUKDmNvcnJlbGF0aW9uX2lkGAEgASgJUg1jb3JyZWxhdGlvbklkEkQKBmZpbHRlchgCIAMoCzIsLmVudGl0aWVzX3YxLkVudGl0aWVzUGFnZVJlcXVlc3QuRmlsdGVyRW50cnlSBmZpbHRlchIxCgZwYWdpbmcYAyABKAsyGS5lbnRpdGllc192MS5QYWdpbmdQYXJhbXNSBnBhZ2luZxo5CgtGaWx0ZXJFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use entitiesPageReplyDescriptor instead')
const EntitiesPageReply$json = const {
  '1': 'EntitiesPageReply',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.entities_v1.ErrorDescription', '10': 'error'},
    const {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.entities_v1.EntitiesPage', '10': 'page'},
  ],
};

/// Descriptor for `EntitiesPageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entitiesPageReplyDescriptor = $convert.base64Decode('ChFFbnRpdGllc1BhZ2VSZXBseRIzCgVlcnJvchgBIAEoCzIdLmVudGl0aWVzX3YxLkVycm9yRGVzY3JpcHRpb25SBWVycm9yEi0KBHBhZ2UYAiABKAsyGS5lbnRpdGllc192MS5FbnRpdGllc1BhZ2VSBHBhZ2U=');
@$core.Deprecated('Use entityIdRequestDescriptor instead')
const EntityIdRequest$json = const {
  '1': 'EntityIdRequest',
  '2': const [
    const {'1': 'correlation_id', '3': 1, '4': 1, '5': 9, '10': 'correlationId'},
    const {'1': 'entity_id', '3': 2, '4': 1, '5': 9, '10': 'entityId'},
  ],
};

/// Descriptor for `EntityIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityIdRequestDescriptor = $convert.base64Decode('Cg9FbnRpdHlJZFJlcXVlc3QSJQoOY29ycmVsYXRpb25faWQYASABKAlSDWNvcnJlbGF0aW9uSWQSGwoJZW50aXR5X2lkGAIgASgJUghlbnRpdHlJZA==');
@$core.Deprecated('Use entityReplyDescriptor instead')
const EntityReply$json = const {
  '1': 'EntityReply',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.entities_v1.ErrorDescription', '10': 'error'},
    const {'1': 'entity', '3': 2, '4': 1, '5': 11, '6': '.entities_v1.Entity', '10': 'entity'},
  ],
};

/// Descriptor for `EntityReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityReplyDescriptor = $convert.base64Decode('CgtFbnRpdHlSZXBseRIzCgVlcnJvchgBIAEoCzIdLmVudGl0aWVzX3YxLkVycm9yRGVzY3JpcHRpb25SBWVycm9yEisKBmVudGl0eRgCIAEoCzITLmVudGl0aWVzX3YxLkVudGl0eVIGZW50aXR5');
@$core.Deprecated('Use entityNameRequestDescriptor instead')
const EntityNameRequest$json = const {
  '1': 'EntityNameRequest',
  '2': const [
    const {'1': 'correlation_id', '3': 1, '4': 1, '5': 9, '10': 'correlationId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `EntityNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityNameRequestDescriptor = $convert.base64Decode('ChFFbnRpdHlOYW1lUmVxdWVzdBIlCg5jb3JyZWxhdGlvbl9pZBgBIAEoCVINY29ycmVsYXRpb25JZBISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use entityRequestDescriptor instead')
const EntityRequest$json = const {
  '1': 'EntityRequest',
  '2': const [
    const {'1': 'correlation_id', '3': 1, '4': 1, '5': 9, '10': 'correlationId'},
    const {'1': 'entity', '3': 2, '4': 1, '5': 11, '6': '.entities_v1.Entity', '10': 'entity'},
  ],
};

/// Descriptor for `EntityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityRequestDescriptor = $convert.base64Decode('Cg1FbnRpdHlSZXF1ZXN0EiUKDmNvcnJlbGF0aW9uX2lkGAEgASgJUg1jb3JyZWxhdGlvbklkEisKBmVudGl0eRgCIAEoCzITLmVudGl0aWVzX3YxLkVudGl0eVIGZW50aXR5');
