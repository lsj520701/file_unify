import 'dart:collection';

import 'unify_upload_callback.dart';

mixin UploadLogic {
  void upload(
      {required String uploadUrl,
      required UnifyUploadCallBack callBack,
      String? fileName,
      String? multipartName,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? uploadParams});
}
