import 'dart:async';

import 'package:pip_client_data_dart/src/version1/clients.dart';
import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import './EntitiesClientV1Fixture.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  3001
]);

void main() {
  group('EntitiesCommandableHttpClientV1', () {
    EntitiesMemoryPersistence persistence;
    EntitiesController controller;
    EntitiesCommandableHttpServiceV1 service;
    EntitiesCommandableHttpClientV1 client;
    EntitiesClientV1Fixture fixture;

    setUp(() async {
      persistence = EntitiesMemoryPersistence();
      persistence.configure(ConfigParams());

      controller = EntitiesController();
      controller.configure(ConfigParams());

      service = EntitiesCommandableHttpServiceV1();
      service.configure(httpConfig);

      client = EntitiesCommandableHttpClientV1();
      client.configure(httpConfig);
      var references = References.fromTuples([
        Descriptor(
            'pip-service-data', 'persistence', 'memory', 'default', '1.0'),
        persistence,
        Descriptor(
            'pip-service-data', 'controller', 'default', 'default', '1.0'),
        controller,
        Descriptor('pip-service-data', 'service', 'http', 'default', '1.0'),
        service,
        Descriptor('pip-service-data', 'client', 'http', 'default', '1.0'),
        client
      ]);

      controller.setReferences(references);
      service.setReferences(references);
      client.setReferences(references);

      fixture = EntitiesClientV1Fixture(client);

      await persistence.open(null);
      await service.open(null);
      await client.open(null);
    });

    tearDown(() async {
      await client.close(null);
      await service.close(null);
      await persistence.close(null);

      await Future.delayed(Duration(milliseconds: 2000));
    });

    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
