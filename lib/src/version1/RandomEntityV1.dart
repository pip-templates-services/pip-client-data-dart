import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'EntityTypeV1.dart';
import 'EntityV1.dart';

class RandomEntityV1 {
  static EntityV1 nextEntity({int siteCount = 100}) {
    return EntityV1(
        id: IdGenerator.nextLong(),
        siteId: RandomEntityV1.nextSiteId(siteCount: siteCount),
        type: RandomEntityV1.nextEntityType(),
        name: RandomString.nextString(10, 25),
        content: RandomString.nextString(0, 50));
  }

  static String nextSiteId({int siteCount = 100}) {
    return RandomInteger.nextInteger(1, siteCount).toString();
  }

  static String nextEntityType() {
    var choice = RandomInteger.nextInteger(0, 3);
    switch (choice) {
      case 0:
        return EntityTypeV1.Type2;
      case 1:
        return EntityTypeV1.Type1;
      case 2:
        return EntityTypeV1.Type3;
      case 3:
        return EntityTypeV1.Unknown;
      default:
        return EntityTypeV1.Unknown;
    }
  }
}
