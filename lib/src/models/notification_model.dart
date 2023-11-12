// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) => List<NotificationModel>.from(json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
    String? id;
    String? type;
    String? notyfiableType;
    String? notyfiableId;
    Data? data;
    String? readAt;
    String? createdAt;
    String? updatedAt;

    NotificationModel({
        this.id,
        this.type,
        this.notyfiableType,
        this.notyfiableId,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        type: json["type"],
        notyfiableType: json["notyfiable_type"],
        notyfiableId: json["notyfiable_id"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        readAt: json["read_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notyfiable_type": notyfiableType,
        "notyfiable_id": notyfiableId,
        "data": data?.toJson(),
        "read_at": readAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Data {
    String? title;
    List<String>? paragraphs;
    Button? button;

    Data({
        this.title,
        this.paragraphs,
        this.button,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        paragraphs: json["paragraphs"] == null ? [] : List<String>.from(json["paragraphs"]!.map((x) => x)),
        button: json["button"] == null ? null : Button.fromJson(json["button"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "paragraphs": paragraphs == null ? [] : List<dynamic>.from(paragraphs!.map((x) => x)),
        "button": button?.toJson(),
    };
}

class Button {
    String? title;
    String? action;

    Button({
        this.title,
        this.action,
    });

    factory Button.fromJson(Map<String, dynamic> json) => Button(
        title: json["title"],
        action: json["action"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "action": action,
    };
}
