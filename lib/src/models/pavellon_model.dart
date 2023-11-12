// To parse this JSON data, do
//
//     final pavellonListModel = pavellonListModelFromJson(jsonString);

import 'dart:convert';

List<PavellonListModel> pavellonListModelFromJson(String str) =>
    List<PavellonListModel>.from(
        json.decode(str).map((x) => PavellonListModel.fromJson(x)));

String pavellonListModelToJson(List<PavellonListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PavellonListModel {
  int? id;
  int? complexityId;
  String? name;
  String? location;
  int? order;
  int? isActive;
  dynamic jsonValue;
  dynamic createdBy;
  int? updatedBy;
  dynamic deletedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  PavellonListModel({
    this.id,
    this.complexityId,
    this.name,
    this.location,
    this.order,
    this.isActive,
    this.jsonValue,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory PavellonListModel.fromJson(Map<String, dynamic> json) =>
      PavellonListModel(
        id: json["id"],
        complexityId: json["complexity_id"],
        name: json["name"],
        location: json["location"],
        order: json["order"],
        isActive: json["is_active"],
        jsonValue: json["json_value"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "complexity_id": complexityId,
        "name": name,
        "location": location,
        "order": order,
        "is_active": isActive,
        "json_value": jsonValue,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
