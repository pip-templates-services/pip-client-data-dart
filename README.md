# <img src="https://uploads-ssl.webflow.com/5ea5d3315186cf5ec60c3ee4/5edf1c94ce4c859f2b188094_logo.svg" alt="Pip.Services Logo" width="200"> <br/> Client library for sample data microservice

This is a client library to the sample data microservice. This library shall be used
as a template to create clients to general purpose data microservices.

Supported functionality:
* Null and Mock clients for testing
* HTTP clients: REST and Commandable
* GRPC clients: Plain and Commandable

Key patterns implemented in this library:

**Zero-time onboarding:** A new developer doesn't have to have a prior khowledge of the code
nor preinstalled and preconfigured development environment.
To get started with any component he/she just need to do 3 simple steps:
+ Checkout the code
+ Launch dependencies via [docker-compose.dev.yml](docker/docker-compose.dev.yml)
+ Execute **dart test**. 

**Automated build and test processes:** Clear, build and test actions are dockerized and scripted.
The scripts shall be run before committing the code. And the same scripts shall be executed in automated
CI/CD pipelines. That approach allows to make identical build and test actions across the entire delivery
pipeline. And have a clear separation between developer and DevOps roles (developers are responsible
for individual components, their build, test and packaging. DevOps are responsible for running CI/CD pipelines, assembling and testing entire system from individual components).

**Multiple communication protocols:** The library contains clients that allow to connect to the microservice several different ways, depending on the environment or client requirements. For instance: on-premises the microservice can be deployed as a docker container. Locally it can be called via GRPC interface and externally via REST. Moreover, several microservice can be packaged into a single process, essentially represending a monolith. In that scenario, then can be called using in-process calls using the DirectClient.

**Monitoring and Observability:** All clients are instrumented to collect logs of called operations, metrics that collect number of calls, average call times and number of erors, and traces. Depending on the deployment configuration that information can be sent to different destinations: console, Promethous, ApplicationInsights and others.

**Versioning:** Data objects and clients are versioned from the beginning. When breaking changes are introduced into the microservice, it shall keep the old version of the interface for backward-compatibility and expose a new version of the interface simultaniously. Then client library will have a new set of objects and clients for the new version, while keeping the old one intact. That will provide a clear versioning and backward-compatibility for users of the microservice.

<a name="links"></a> Quick links:

* Communication Protocols:
  - [gRPC Version 1](https://github.com/pip-templates-services/pip-service-data-dart/blob/main/lib/src/protos/entities_v1.proto)
  - [HTTP Version 1](https://github.com/pip-templates-services/pip-service-data-dart/blob/main/lib/src/swagger/entities_v1.yaml)
* [Microservice](https://github.com/pip-templates-services/pip-service-data-dart)
* [API Reference](https://pub.dev/documentation/pip_client_data/latest/pip_client_data/pip_client_data-library.html)
* [Change Log](CHANGELOG.md)


## Contract

The contract of the microservice is presented below. 

```dart
class EntityV1 implements IStringIdentifiable {
    @override
    String id;        // Entity ID
    String siteId;    // ID of a work site (field installation)
    String type;      // Entity type: Type2, Type1 or Type3
    String name;      // Human readable name
    String content;   // String content
}

abstract class  IEntitiesClientV1 {
    Future<DataPage<EntityV1>> getEntities(String correlationId, FilterParams filter, PagingParams paging);

    Future<EntityV1> getEntityById(String correlationId, String entityId);

    Future<EntityV1> getEntityByName(String correlationId, string entityId);

    Future<EntityV1> createEntity(String correlationId, EntityV1 entity);

    Future<EntityV1> updateEntity(String correlationId, EntityV1 entity);

    Future<EntityV1> deleteEntityById(String correlationId, String entityId);
}

```

## Get

Get the client library source from GitHub:
```bash
git clone git@github.com:pip-templates-services/pip-client-data-nodex.git
```

Install the microservice as a binary dependency:
```bash
pub get
```

## Use
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  pip_service_data_dart: version
```

Now you can install package from the command line:
```bash
pub get
```

Inside your code get the reference to the client SDK
```dart
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_client_data_dart/pip_client_data_dart.dart';
```

Instantiate the client
```dart
// Create the client instance
var client = EntitiesCommandableHttpClientV1();
```

Define client connection parameters
```dart
// Client configuration
var httpConfig = ConfigParams.fromTuples([
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
]);
// Configure the client
client.configure(httpConfig);
```

Connect to the microservice
```dart
// Connect to the microservice
await client.open(null);
    
// Work with the microservice
...
```

Call the microservice using the client API
```dart
// Define a entity
var entity: EntityV1 = {
    id: '1',
    site_id: '1',
    type: EntityTypeV1.Type1,
    name: '00001',
    content: 'ABC'
};

// Create the entity
var entity = await this.client.createEntity(null, ENTITY1);

// Do something with the returned entity...

// Get a list of entities
var page = await this.client.getEntities(
    null,
    FilterParams.fromTuples([
        "name", "TestEntity",
    ]),
    PagingParams(0, 10)
);

// Do something with the returned page...
// E.g. entity = page.data[0];
```

## Develop

For development you shall install the following prerequisites:
* Dart SDK 2
* Visual Studio Code or another IDE of your choice
* Docker

Install dependencies:
```bash
pub get
```

Compile the microservice:
```bash
tsc
```

Before running tests launch infrastructure services and required microservices:
```bash
docker-compose -f ./docker-compose.dev.yml up
```

Run automated tests:
```bash
dart run test
```

Generate GRPC protobuf stubs:
```bash
./protogen.ps1
```

Generate API documentation:
```bash
./docgen.ps1
```

Before committing changes run dockerized build and test as:
```bash
./build.ps1
./test.ps1
./clear.ps1
```

## Contacts

This microservice was created and currently maintained by *Sergey Seroukhov* and *Danil Prisyzhniy*.
