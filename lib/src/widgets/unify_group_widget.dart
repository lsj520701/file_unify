import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

 class UnifyGroupWidget extends StatefulWidget {
  Map<String, dynamic>? headers; //请求头
  Map<String, dynamic>? uploadParams; //接口参数
  String? multipartName;
  Widget child;

  UnifyGroupWidget(
      {Key? key,
      required this.child,
      this.headers,
      this.uploadParams,
      this.multipartName})
      : super(key: key);

  @override
  State<UnifyGroupWidget> createState() => UnifyGroupWidgetState();
}

class UnifyGroupWidgetState extends State<UnifyGroupWidget> {
  String? getMultipartName() {
    return widget.multipartName;
  }

  Map<String, dynamic>? getHeaders() {
    return widget.headers;
  }

  Map<String, dynamic>? getParams() {
    return widget.uploadParams;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
