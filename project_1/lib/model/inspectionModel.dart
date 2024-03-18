// To parse this JSON data, do
//
//     final inspectionlist = inspectionlistFromJson(jsonString);

import 'dart:convert';

Inspectionlist inspectionlistFromJson(String str) => Inspectionlist.fromJson(json.decode(str));

String inspectionlistToJson(Inspectionlist data) => json.encode(data.toJson());

class Inspectionlist {
  bool? success;
  List<Datum>? data;
  String? message;
  int? code;

  Inspectionlist({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  factory Inspectionlist.fromJson(Map<String, dynamic> json) => Inspectionlist(
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
  int? uid;
  int? propertyId;
  String? name;
  String? note;
  String? discription;
  String? signature;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? image6;
  String? image7;
  String? image8;
  String? image9;
  String? image10;
  DateTime? date;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.uid,
    this.propertyId,
    this.name,
    this.note,
    this.discription,
    this.signature,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.image6,
    this.image7,
    this.image8,
    this.image9,
    this.image10,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    uid: json["uid"],
    propertyId: json["property_id"],
    name: json["name"],
    note: json["note"],
    discription: json["discription"],
    signature: json["signature"],
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    image4: json["image4"],
    image5: json["image5"],
    image6: json["image6"],
    image7: json["image7"],
    image8: json["image8"],
    image9: json["image9"],
    image10: json["image10"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "property_id": propertyId,
    "name": name,
    "note": note,
    "discription": discription,
    "signature": signature,
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "image4": image4,
    "image5": image5,
    "image6": image6,
    "image7": image7,
    "image8": image8,
    "image9": image9,
    "image10": image10,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}



