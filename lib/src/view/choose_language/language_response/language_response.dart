// To parse this JSON data, do
//
//     final languageResponse = languageResponseFromJson(jsonString);

import 'dart:convert';

LanguageResponse languageResponseFromJson(String str) =>
    LanguageResponse.fromJson(json.decode(str));

String languageResponseToJson(LanguageResponse data) =>
    json.encode(data.toJson());

class LanguageResponse {
  LanguageResponse({
    this.status,
    this.statusCode,
    this.data,
  });

  final int? status;
  final int? statusCode;
  final List<Datum>? data;

  factory LanguageResponse.fromJson(Map<String, dynamic> json) =>
      LanguageResponse(
        status: json["status"] == null ? null : json["status"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.isChecked = false,
  });

  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool? isChecked;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
