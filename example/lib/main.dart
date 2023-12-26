import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:file_unify/file_unify.dart';
import 'package:file_unify/src/widgets/unify_group_widget.dart';
import 'package:file_unify/src/widgets/unify_item_widget.dart';

void main() {
  runApp(
      MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _fileUnifyPlugin = FileUnify();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _fileUnifyPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Widget _fileWidget(BuildContext context) {
    if (status == "default") {
      return Container();
    } else if (status == "ok") {
      return UnifyGroupWidget(
          child: UnifyItemWidget(
        showWidget: Container(

        width: double.infinity,
        height: 40
        ,
          color: Colors.green,
        ),
      ));
    } else if (status == "err") {
      return Container();
    } else {
      return Container();
    }
  }

  String status = "default";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            _fileWidget(context),
            Container(
              height: 20,
              color: Colors.black12,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  status="ok";
                });
              },

              child: Container(
                alignment: Alignment.center,
                height: 44,
                width: double.maxFinite,
                child: Text("模拟成功加载"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  status="error";
                });

              },
              child: Container(
                alignment: Alignment.center,
                height: 44,
                width: double.maxFinite,
                child: Text("模拟加载失败"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
