// To parse this JSON data, do
//
//     final procedureTypeModel = procedureTypeModelFromJson(jsonString);

import 'dart:convert';

List<PrevisionTypeModel> previsionTypeModelFromJson(String str) => List<PrevisionTypeModel>.from(json.decode(str).map((x) => PrevisionTypeModel.fromJson(x)));

String previsionTypeModelToJson(List<PrevisionTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrevisionTypeModel {
    int? id;
    String? name;

    PrevisionTypeModel({
        this.id,
        this.name,
    });

    factory PrevisionTypeModel.fromJson(Map<String, dynamic> json) => PrevisionTypeModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
