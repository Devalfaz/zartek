class ResponseModel<T> {
  ResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as T,
    );
  }
  final bool success;
  final String message;
  final T data;
}
