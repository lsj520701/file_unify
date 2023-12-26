import 'package:flutter_test/flutter_test.dart';
import 'package:file_unify/file_unify.dart';
import 'package:file_unify/file_unify_platform_interface.dart';
import 'package:file_unify/file_unify_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFileUnifyPlatform
    with MockPlatformInterfaceMixin
    implements FileUnifyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FileUnifyPlatform initialPlatform = FileUnifyPlatform.instance;

  test('$MethodChannelFileUnify is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFileUnify>());
  });

  test('getPlatformVersion', () async {
    FileUnify fileUnifyPlugin = FileUnify();
    MockFileUnifyPlatform fakePlatform = MockFileUnifyPlatform();
    FileUnifyPlatform.instance = fakePlatform;

    expect(await fileUnifyPlugin.getPlatformVersion(), '42');
  });
}
