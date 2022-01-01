import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'supports/path_provider.dart';

class TestHelper {
  static void setUpAll() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
  }

  static void tearDown() async {}
}
