// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'dart:convert';

List<PatientModel> patientModelFromJson(String str) => List<PatientModel>.from(json.decode(str).map((x) => PatientModel.fromJson(x)));

String patientModelToJson(List<PatientModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientModel {
    int? id;
    String? name;
    String? lastName;
    String? uid;
    dynamic dateOfBirth;
    dynamic phone;
    String? email;
    dynamic emailVerifiedAt;
    int? order;
    int? isActive;
    dynamic jsonValue;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    PatientModel({
        this.id,
        this.name,
        this.lastName,
        this.uid,
        this.dateOfBirth,
        this.phone,
        this.email,
        this.emailVerifiedAt,
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

    factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        uid: json["uid"],
        dateOfBirth: json["date_of_birth"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        order: json["order"],
        isActive: json["is_active"],
        jsonValue: json["json_value"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "uid": uid,
        "date_of_birth": dateOfBirth,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "order": order,
        "is_active": isActive,
        "json_value": jsonValue,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}
