// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    Data? data;
    String? message;
    int? status;

    LoginModel({
        this.data,
        this.message,
        this.status,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
    };
}

class Data {
    String? token;
    User? user;

    Data({
        this.token,
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? name;
    String? slug;
    dynamic picture;
    String? email;
    String? phone;
    dynamic emailVerifiedAt;
    dynamic balance;
    String? type;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    User({
        this.id,
        this.name,
        this.slug,
        this.picture,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.balance,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        picture: json["picture"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        balance: json["balance"],
        type: json["type"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "picture": picture,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "balance": balance,
        "type": type,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
