// To parse this JSON data, do
//
//     final SugeryTypeModel = SugeryTypeModelFromJson(jsonString);

import 'dart:convert';

List<SugeryTypeModel> SugeryTypeModelFromJson(String str) =>
    List<SugeryTypeModel>.from(
        json.decode(str).map((x) => SugeryTypeModel.fromJson(x)));

String SugeryTypeModelToJson(List<SugeryTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SugeryTypeModel {
  int? id;
  String? name;
  String? slug;
  int? order;
  int? isActive;
  dynamic jsonValue;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? complexityId;
  int? typeId;

  SugeryTypeModel(
      {this.id,
      this.name,
      this.slug,
      this.order,
      this.isActive,
      this.jsonValue,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.complexityId,
      this.typeId});

  factory SugeryTypeModel.fromJson(Map<String, dynamic> json) =>
      SugeryTypeModel(
          id: json["id"],
          name: json["name"],
          slug: json["slug"],
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
          complexityId: json["complexity_id"],
          typeId: json["type_id"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
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
