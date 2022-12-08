// To parse this JSON data, do
//
//     final googleLoginResponse = googleLoginResponseFromJson(jsonString);

import 'dart:convert';

GoogleLoginResponse googleLoginResponseFromJson(String str) =>
    GoogleLoginResponse.fromJson(json.decode(str));

String googleLoginResponseToJson(GoogleLoginResponse data) =>
    json.encode(data.toJson());

class GoogleLoginResponse {
  GoogleLoginResponse({
    this.status,
    this.msg,
    this.statuscode,
    this.data,
  });

  final int? status;
  final String? msg;
  final int? statuscode;
  final Data? data;

  factory GoogleLoginResponse.fromJson(Map<String, dynamic> json) =>
      GoogleLoginResponse(
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        statuscode: json["statuscode"] == null ? null : json["statuscode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "msg": msg == null ? null : msg,
        "statuscode": statuscode == null ? null : statuscode,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
  });

  final List<String>? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null
            ? null
            : List<String>.from(json["token"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "token":
            token == null ? null : List<dynamic>.from(token!.map((x) => x)),
      };
}
