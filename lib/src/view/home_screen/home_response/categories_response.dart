// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) =>
    CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) =>
    json.encode(data.toJson());

class CategoriesResponse {
  CategoriesResponse({
    this.status,
    this.statusCode,
    this.data,
  });

  final int? status;
  final int? statusCode;
  final List<CategoriesDatum>? data;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        status: json["status"] == null ? null : json["status"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        data: json["data"] == null
            ? null
            : List<CategoriesDatum>.from(json["data"].map((x) => CategoriesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "statusCode": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoriesDatum {
  CategoriesDatum({
    this.id,
    this.name,
    this.categoryName,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? categoryName;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CategoriesDatum.fromJson(Map<String, dynamic> json) => CategoriesDatum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        categoryName:
            json["category_name"] == null ? null : json["category_name"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
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
        "category_name": categoryName == null ? null : categoryName,
        "image_url": imageUrl == null ? null : imageUrl,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
