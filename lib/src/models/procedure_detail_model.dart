// To parse this JSON data, do
//
//     final procedureDetailModel = procedureDetailModelFromJson(jsonString);

import 'dart:convert';

ProcedureDetailModel procedureDetailModelFromJson(String str) => ProcedureDetailModel.fromJson(json.decode(str));

String procedureDetailModelToJson(ProcedureDetailModel data) => json.encode(data.toJson());

class ProcedureDetailModel {
    int? id;
    int? userId;
    int? procedureId;
    int? previsionId;
    int? typeId;
    int? pavilionId;
    DateTime? date;
    String? hour;
    String? status;
    int? order;
    int? isActive;
    dynamic jsonValue;
    dynamic createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? statusMedicalEquipment;
    Users? users;
    Pavilions? procedures;
    Pavilions? types;
    Pavilions? previsions;
    Pavilions? pavilions;
    List<Team>? teams;

    ProcedureDetailModel({
        this.id,
        this.userId,
        this.procedureId,
        this.previsionId,
        this.typeId,
        this.pavilionId,
        this.date,
        this.hour,
        this.status,
        this.order,
        this.isActive,
        this.jsonValue,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.statusMedicalEquipment,
        this.users,
        this.procedures,
        this.types,
        this.previsions,
        this.pavilions,
        this.teams,
    });

    factory ProcedureDetailModel.fromJson(Map<String, dynamic> json) => ProcedureDetailModel(
        id: json["id"],
        userId: json["user_id"],
        procedureId: json["procedure_id"],
        previsionId: json["prevision_id"],
        typeId: json["type_id"],
        pavilionId: json["pavilion_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        hour: json["hour"],
        status: json["status"],
        order: json["order"],
        isActive: json["is_active"],
        jsonValue: json["json_value"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        statusMedicalEquipment: json["status_medical_equipment"],
        users: json["users"] == null ? null : Users.fromJson(json["users"]),
        procedures: json["procedures"] == null ? null : Pavilions.fromJson(json["procedures"]),
        types: json["types"] == null ? null : Pavilions.fromJson(json["types"]),
        previsions: json["previsions"] == null ? null : Pavilions.fromJson(json["previsions"]),
        pavilions: json["pavilions"] == null ? null : Pavilions.fromJson(json["pavilions"]),
        teams: json["teams"] == null ? [] : List<Team>.from(json["teams"]!.map((x) => Team.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "procedure_id": procedureId,
        "prevision_id": previsionId,
        "type_id": typeId,
        "pavilion_id": pavilionId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "hour": hour,
        "status": status,
        "order": order,
        "is_active": isActive,
        "json_value": jsonValue,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "status_medical_equipment": statusMedicalEquipment,
        "users": users?.toJson(),
        "procedures": procedures?.toJson(),
        "types": types?.toJson(),
        "previsions": previsions?.toJson(),
        "pavilions": pavilions?.toJson(),
        "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x.toJson())),
    };
}

class Pavilions {
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
    dynamic code;
    String? link;
    String? phone;
    String? description;
    int? typeId;
    String? slug;

    Pavilions({
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
        this.code,
        this.link,
        this.phone,
        this.description,
        this.typeId,
        this.slug,
    });

    factory Pavilions.fromJson(Map<String, dynamic> json) => Pavilions(
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
        code: json["code"],
        link: json["link"],
        phone: json["phone"],
        description: json["description"],
        typeId: json["type_id"],
        slug: json["slug"],
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
        "code": code,
        "link": link,
        "phone": phone,
        "description": description,
        "type_id": typeId,
        "slug": slug,
    };
}

class Team {
    int? id;
    int? professionalId;
    int? professionalProfileId;
    int? scheduleProceduresId;
    DateTime? createdAt;
    DateTime? updatedAt;
    Professional? professional;

    Team({
        this.id,
        this.professionalId,
        this.professionalProfileId,
        this.scheduleProceduresId,
        this.createdAt,
        this.updatedAt,
        this.professional,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        professionalId: json["professional_id"],
        professionalProfileId: json["professional_profile_id"],
        scheduleProceduresId: json["schedule_procedures_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        professional: json["professional"] == null ? null : Professional.fromJson(json["professional"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "professional_id": professionalId,
        "professional_profile_id": professionalProfileId,
        "schedule_procedures_id": scheduleProceduresId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "professional": professional?.toJson(),
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
    Pavilions? professionalProfiles;

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
        this.professionalProfiles,
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        professionalProfiles: json["professional_profiles"] == null ? null : Pavilions.fromJson(json["professional_profiles"]),
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
        "professional_profiles": professionalProfiles?.toJson(),
    };
}

class Users {
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
    int? updatedBy;
    dynamic deletedBy;
    DateTime? createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    Users({
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

    factory Users.fromJson(Map<String, dynamic> json) => Users(
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
