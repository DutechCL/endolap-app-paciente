// To parse this JSON data, do
//
//     final professionalAvailableModel = professionalAvailableModelFromJson(jsonString);

import 'dart:convert';

ProfessionalAvailableModel professionalAvailableModelFromJson(String str) =>
    ProfessionalAvailableModel.fromJson(json.decode(str));

String professionalAvailableModelToJson(ProfessionalAvailableModel data) =>
    json.encode(data.toJson());

class ProfessionalAvailableModel {
  List<Map<String, String>>? profiles;
  List<List<Professional>>? professionals;
  List<dynamic>? teams;

  ProfessionalAvailableModel({
    this.profiles,
    this.professionals,
    this.teams,
  });

  factory ProfessionalAvailableModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalAvailableModel(
        profiles: json["profiles"] == null
            ? []
            : List<Map<String, String>>.from(json["profiles"]!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
        professionals: json["professionals"] == null
            ? []
            : List<List<Professional>>.from(json["professionals"]!.map((x) =>
                List<Professional>.from(
                    x.map((x) => Professional.fromJson(x))))),
        teams: json["teams"] == null
            ? []
            : List<dynamic>.from(json["teams"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "profiles": profiles == null
            ? []
            : List<dynamic>.from(profiles!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "professionals": professionals == null
            ? []
            : List<dynamic>.from(professionals!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x)),
      };
}

class Professional {
  int? id;
  int? bankId;
  int? typeAccountId;
  int? professionalProfileId;
  String? name;
  String? lastName;
  String? address;
  String? phone;
  dynamic url;
  String? email;
  String? uid;
  String? bankAccount;
  int? order;
  int? isActive;
  dynamic jsonValue;
  int? createdBy;
  int? updatedBy;
  dynamic deletedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Professional({
    this.id,
    this.bankId,
    this.typeAccountId,
    this.professionalProfileId,
    this.name,
    this.lastName,
    this.address,
    this.phone,
    this.url,
    this.email,
    this.uid,
    this.bankAccount,
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

  factory Professional.fromJson(Map<String, dynamic> json) => Professional(
        id: json["id"],
        bankId: json["bank_id"],
        typeAccountId: json["type_account_id"],
        professionalProfileId: json["professional_profile_id"],
        name: json["name"],
        lastName: json["last_name"],
        address: json["address"],
        phone: json["phone"],
        url: json["url"],
        email: json["email"],
        uid: json["uid"],
        bankAccount: json["bank_account"],
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
        "bank_id": bankId,
        "type_account_id": typeAccountId,
        "professional_profile_id": professionalProfileId,
        "name": name,
        "last_name": lastName,
        "address": address,
        "phone": phone,
        "url": url,
        "email": email,
        "uid": uid,
        "bank_account": bankAccount,
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
