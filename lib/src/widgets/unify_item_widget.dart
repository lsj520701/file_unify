import 'package:flutter/material.dart';

class UnifyItemWidget extends StatefulWidget {
  String? fileLocalPath; //文件本地地址
  String? fileName; //文件名称
  Widget? showWidget; //展示地址
  String? uploadPath;//上传地址



  UnifyItemWidget(
      {Key? key,
      this.fileName,
      this.fileLocalPath,
      this.showWidget})
      : super(key: key);

  @override
  State<UnifyItemWidget> createState() => _UnifyItemWidgetState();
}

class _UnifyItemWidgetState extends State<UnifyItemWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.showWidget ?? Container();
  }
}
