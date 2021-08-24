import 'package:pip_client_data_dart/src/version1/clients.dart';
import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'EntitiesClientV1Fixture.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  3002
]);

void main() {
  group('EntitiesRestClientV1', () {
    EntitiesMemoryPersistence persistence;
    EntitiesController controller;
    EntitiesRestServiceV1 service;
    EntitiesRestClientV1 client;
    EntitiesClientV1Fixture fixture;

    setUpAll(() async {
      var logger = ConsoleLogger();
      persistence = EntitiesMemoryPersistence();
      controller = EntitiesController();

      service = EntitiesRestServiceV1();
      service.configure(httpConfig);

      var references = References.fromTuples([
        Descriptor(
            'pip-services-commons', 'logger', 'console', 'default', '1.0'),
        logger,
        Descriptor(
            'pip-service-data', 'persistence', 'memory', 'default', '1.0'),
        persistence,
        Descriptor(
            'pip-service-data', 'controller', 'default', 'default', '1.0'),
        controller,
        Descriptor('pip-service-data', 'service', 'rest', 'default', '1.0'),
        service
      ]);
      controller.setReferences(references);
      service.setReferences(references);

      client = EntitiesRestClientV1();
      client.setReferences(references);
      client.configure(httpConfig);

      fixture = EntitiesClientV1Fixture(client);

      await service.open(null);
      await client.open(null);
    });

    setUp(() async {
      await persistence.clear(null);
    });

    tearDownAll(() async {
      await client.close(null);
      await service.close(null);
    });

    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
