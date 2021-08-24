import 'package:pip_client_data_dart/src/version1/clients.dart';
import 'package:test/test.dart';
import './EntitiesClientV1Fixture.dart';

void main() {
  group('EntitiesMockClientV1', () {
    EntitiesMockClientV1 client;
    EntitiesClientV1Fixture fixture;

    setUp(() async {
      client = EntitiesMockClientV1();
      fixture = EntitiesClientV1Fixture(client);
    });

    tearDown(() async {});

    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
