import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'file_unify_platform_interface.dart';

/// An implementation of [FileUnifyPlatform] that uses method channels.
class MethodChannelFileUnify extends FileUnifyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('file_unify');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
