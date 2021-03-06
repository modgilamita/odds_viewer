
class Result {
  final bool success;
  final String message;

  Result({
    required this.success,
    required this.message,
});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      success: json['success'],
      message: json['message'],
    );
  }
}

