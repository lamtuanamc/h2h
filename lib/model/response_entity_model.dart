import 'package:example_hack2hire/model/data_model.dart';
import 'package:example_hack2hire/model/meta_model.dart';

class ResponseEntity {
  ResponseEntity({
    this.data,
    this.meta,
  });

  Data? data;
  Meta? meta;

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => ResponseEntity(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}
