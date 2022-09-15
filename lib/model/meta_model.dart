import 'package:example_hack2hire/model/error_model.dart';

class Meta {
  Meta({
    this.code,
    this.message,
  });

  int? code;
  List<Error>? errors;
  String? message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
