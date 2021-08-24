import 'dart:async';

import 'package:pip_client_data_dart/src/version1/IEntitiesClient.dart';
import 'package:pip_service_data_dart/pip_service_data_dart.dart';
import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

final ENTITY1 = EntityV1(
    id: '1',
    name: '00001',
    type: EntityTypeV1.Type1,
    siteId: '1',
    content: 'ABC');

final ENTITY2 = EntityV1(
    id: '2',
    name: '00002',
    type: EntityTypeV1.Type2,
    siteId: '1',
    content: 'XYZ');

class EntitiesClientV1Fixture {
  IEntitiesClientV1 _client;

  EntitiesClientV1Fixture(IEntitiesClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  Future<void> testCrudOperations() async {
    EntityV1 entity1;

    // Create the first entity
    var entity = await _client.createEntity('123', ENTITY1);
    expect(entity, isNotNull);
    expect(ENTITY1.name, entity.name);
    expect(ENTITY1.siteId, entity.siteId);
    expect(ENTITY1.type, entity.type);
    expect(ENTITY1.content, entity.content);

    // Create the second entity
    entity = await _client.createEntity('123', ENTITY2);
    expect(entity, isNotNull);
    expect(ENTITY2.name, entity.name);
    expect(ENTITY2.siteId, entity.siteId);
    expect(ENTITY2.type, entity.type);
    expect(ENTITY2.content, entity.content);

    // Get all entities
    var page = await _client.getEntities('123', FilterParams(), PagingParams());
    expect(page, isNotNull);
    expect(page.data.length, 2);
    entity1 = page.data[0];

    // Update the entity
    entity1.name = 'ABC';

    entity = await _client.updateEntity('123', entity1);
    expect(entity, isNotNull);
    expect(entity1.id, entity.id);
    expect('ABC', entity.name);

    // Get entity by udi
    entity = await _client.getEntityByName('123', entity1.name);
    expect(entity, isNotNull);
    expect(entity1.id, entity.id);

    // Delete the entity
    entity = await _client.deleteEntityById('123', entity1.id);
    expect(entity, isNotNull);
    expect(entity1.id, entity.id);

    // Try to get deleted entity
    entity = await _client.getEntityById('123', entity1.id);
    expect(entity, isNull);
  }
}
