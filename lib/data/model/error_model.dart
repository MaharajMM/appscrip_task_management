import 'dart:convert';

class ErrorModel {
  final String? error;

  ErrorModel({
    this.error,
  });

  ErrorModel copyWith({
    String? error,
  }) =>
      ErrorModel(
        error: error ?? this.error,
      );

  factory ErrorModel.fromJson(String str) => ErrorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromMap(Map<String, dynamic> json) => ErrorModel(
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
      };
}
