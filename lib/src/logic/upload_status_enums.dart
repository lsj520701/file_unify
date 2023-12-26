
enum UploadStatusEnum{
  UNSTRAT(value: 1, name: "unstart"),
  UPLOADING(value: 2, name: "uploading"),
  FINISH(value: 3, name: "finish"),
  ERROR(value: 2, name: "error");

  final int value;
  final String name;

  const UploadStatusEnum({required this.value, required this.name});
}