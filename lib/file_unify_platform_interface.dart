import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'file_unify_method_channel.dart';

abstract class FileUnifyPlatform extends PlatformInterface {
  /// Constructs a FileUnifyPlatform.
  FileUnifyPlatform() : super(token: _token);

  static final Object _token = Object();

  static FileUnifyPlatform _instance = MethodChannelFileUnify();

  /// The default instance of [FileUnifyPlatform] to use.
  ///
  /// Defaults to [MethodChannelFileUnify].
  static FileUnifyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FileUnifyPlatform] when
  /// they register themselves.
  static set instance(FileUnifyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
