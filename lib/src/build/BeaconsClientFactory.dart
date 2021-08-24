import 'package:pip_client_data_dart/src/version1/clients.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

class EntitiesClientFactory extends Factory {
  static final NullClientDescriptor =
      Descriptor('pip-service-data', 'client', 'null', '*', '1.0');
  static final DirectClientDescriptor =
      Descriptor('pip-service-data', 'client', 'direct', '*', '1.0');
  static final CommandableHttpClientDescriptor =
      Descriptor('pip-service-data', 'client', 'commandable-http', '*', '1.0');
  static final CommandableGrpcClientV1Descriptor =
      Descriptor('pip-service-data', 'client', 'commandable-grpc', '*', '1.0');
  static final CommandableLambdaClientV1Descriptor = Descriptor(
      'pip-service-data', 'client', 'commandable-lambda', '*', '1.0');
  static final LambdaClientV1Descriptor =
      Descriptor('pip-service-data', 'client', 'lambda', 'default', '1.0');
  static final GrpcClientV1Descriptor =
      Descriptor('pip-service-data', 'client', 'grpc', '*', '1.0');
  static final RestClientV1Descriptor =
      Descriptor('pip-service-data', 'client', 'rest', '*', '1.0');
  static final EntitiesMockClientV1Descriptor =
      Descriptor('pip-service-data', 'client', 'mock', '*', '1.0');

  EntitiesClientFactory() : super() {
    registerAsType(
        EntitiesClientFactory.NullClientDescriptor, EntitiesNullClientV1);
    registerAsType(EntitiesClientFactory.EntitiesMockClientV1Descriptor,
        EntitiesMockClientV1);
    registerAsType(
        EntitiesClientFactory.DirectClientDescriptor, EntitiesDirectClientV1);
    registerAsType(EntitiesClientFactory.CommandableHttpClientDescriptor,
        EntitiesCommandableHttpClientV1);
    registerAsType(EntitiesClientFactory.CommandableGrpcClientV1Descriptor,
        EntitiesCommandableGrpcClientV1);
    // registerAsType(EntitiesClientFactory.CommandableLambdaClientV1Descriptor,
    //     EntitiesCommandableLambdaClientV1);
    // registerAsType(EntitiesClientFactory.RestClientV1Descriptor, EntitiesRestClientV1);
    // registerAsType(EntitiesClientFactory.GrpcClientV1Descriptor, EntitiesGrpcClientV1);
    // registerAsType(EntitiesClientFactory.LambdaClientV1Descriptor, EntitiesLambdaClientV1);
  }
}
