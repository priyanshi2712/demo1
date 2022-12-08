// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

class NotificationResponse {
  NotificationResponse({
    this.status,
    this.statusCode,
    this.data,
  });

  final int? status;
  final int? statusCode;
  final List<NotificationDatum>? data;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        status: json["status"] == null ? null : json["status"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null
            ? null
            : List<NotificationDatum>.from(json["data"].map((x) => NotificationDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NotificationDatum {
  NotificationDatum({
    this.id,
    this.title,
    this.description,
    this.languageId,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? languageId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory NotificationDatum.fromJson(Map<String, dynamic> json) => NotificationDatum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        languageId: json["language_id"] == null ? null : json["language_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "language_id": languageId == null ? null : languageId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
