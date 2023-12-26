
import 'file_unify_platform_interface.dart';


class FileUnify {
  Future<String?> getPlatformVersion() {
    return FileUnifyPlatform.instance.getPlatformVersion();
  }
}
