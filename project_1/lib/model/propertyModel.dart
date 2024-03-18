// To parse this JSON data, do
//
//     final propertylist = propertylistFromJson(jsonString);

import 'dart:convert';

Propertylist propertylistFromJson(String str) => Propertylist.fromJson(json.decode(str));

String propertylistToJson(Propertylist data) => json.encode(data.toJson());

class Propertylist {
  bool? success;
  List<Datum>? data;
  String? message;
  int? code;

  Propertylist({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  factory Propertylist.fromJson(Map<String, dynamic> json) => Propertylist(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class Datum {
  int? id;
  String? name;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zip;
  DateTime? startdate;
  DateTime? enddate;
  String? status;
  DateTime? createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.name,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.startdate,
    this.enddate,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zip: json["zip"],
    startdate: json["startdate"] == null ? null : DateTime.parse(json["startdate"]),
    enddate: json["enddate"] == null ? null : DateTime.parse(json["enddate"]),
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "zip": zip,
    "startdate": "${startdate!.year.toString().padLeft(4, '0')}-${startdate!.month.toString().padLeft(2, '0')}-${startdate!.day.toString().padLeft(2, '0')}",
    "enddate": "${enddate!.year.toString().padLeft(4, '0')}-${enddate!.month.toString().padLeft(2, '0')}-${enddate!.day.toString().padLeft(2, '0')}",
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt,
  };
}
