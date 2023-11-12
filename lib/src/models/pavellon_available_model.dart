// To parse this JSON data, do
//
//     final pavellonAvailableModel = pavellonAvailableModelFromJson(jsonString);

import 'dart:convert';

List<PavellonAvailableModel> pavellonAvailableModelFromJson(String str) => List<PavellonAvailableModel>.from(json.decode(str).map((x) => PavellonAvailableModel.fromJson(x)));

String pavellonAvailableModelToJson(List<PavellonAvailableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PavellonAvailableModel {
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

    PavellonAvailableModel({
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

    factory PavellonAvailableModel.fromJson(Map<String, dynamic> json) => PavellonAvailableModel(
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
