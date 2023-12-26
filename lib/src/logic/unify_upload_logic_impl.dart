import 'dart:collection';

import 'package:dio/dio.dart';

import 'unify_upload_callback.dart';
import 'upload_file_mixin.dart';

class UnifyUploadLogicImpl with UploadLogic {
  @override
  void upload(
      {required String uploadUrl,
      required UnifyUploadCallBack callBack,
      String? fileName,
      String? multipartName,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? uploadParams}) async {
    ///创建Dio
    Dio dio = Dio();
    Map<String, dynamic> map = {};
    map[multipartName ?? "file"] =
        MultipartFile.fromFileSync(uploadUrl, filename: fileName);

    if (uploadParams != null) map.addAll(uploadParams);
    Options options = Options(headers: {});
    if (headers != null) {
      for (var entry in headers.entries) {
        options.headers![entry.key] = entry.value;
      }
    }
    ///通过FormData
    FormData formData = FormData.fromMap(map);
    ///发送post
    Response response = await dio.post(
      uploadUrl, data: formData,
      options: options,

      ///这里是发送请求回调函数
      ///[progress] 当前的进度
      ///[total] 总进度
      onSendProgress: (int progress, int total) {
        callBack.uploadProgressCallBack(progress, total);
      },
    );

    ///服务器响应结果
    /// ///服务器响应结果
    var data = response.data;
    if (response.statusCode == 200) {
      callBack.uploadSucceedCallBack(data);
    } else {
      callBack.uploadErrorCallBack();
    }
  }
}
