// To parse this JSON data, do
//
//     final graphics = graphicsFromMap(jsonString);

import 'dart:convert';

class GraphicsModel {
  GraphicsModel({
    required this.id,
    required this.data,
  });

  final String id;
  final List<Datum?>? data;

  factory GraphicsModel.fromJson(String str) =>
      GraphicsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GraphicsModel.fromMap(Map<String, dynamic> json) => GraphicsModel(
        id: json["id"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toMap())),
      };
}

class Datum {
  Datum({
    required this.domain,
    required this.measure,
  });

  final String? domain;
  final int? measure;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        domain: json["domain"],
        measure: json["measure"],
      );

  Map<String, dynamic> toMap() => {
        "domain": domain,
        "measure": measure,
      };
}
