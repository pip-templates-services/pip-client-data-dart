import 'package:pip_client_data_dart/src/version1/clients.dart';
import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import './EntitiesClientV1Fixture.dart';

void main() {
  group('EntitiesDirectClientV1', () {
    EntitiesMemoryPersistence persistence;
    EntitiesController controller;
    EntitiesDirectClientV1 client;
    EntitiesClientV1Fixture fixture;

    setUp(() async {
      persistence = EntitiesMemoryPersistence();
      persistence.configure(ConfigParams());

      controller = EntitiesController();
      controller.configure(ConfigParams());

      client = EntitiesDirectClientV1();

      var references = References.fromTuples([
        Descriptor(
            'pip-service-data', 'persistence', 'memory', 'default', '1.0'),
        persistence,
        Descriptor(
            'pip-service-data', 'controller', 'default', 'default', '1.0'),
        controller,
        Descriptor('pip-service-data', 'client', 'direct', 'default', '1.0'),
        client
      ]);

      controller.setReferences(references);
      client.setReferences(references);

      fixture = EntitiesClientV1Fixture(client);

      await persistence.open(null);
    });

    tearDown(() async {
      await persistence.close(null);
    });

    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
