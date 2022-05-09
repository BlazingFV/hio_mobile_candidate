// To parse this JSON data, do
//
//     final authenticationObject = authenticationObjectFromMap(jsonString);

import 'dart:convert';

class AuthenticationObject {
  AuthenticationObject({
    this.id,
    this.oid,
    this.esId,
    this.resumes,
    this.user,
  });

  int? id;
  String? oid;
  String? esId;
  List<dynamic>? resumes;
  User? user;

  AuthenticationObject copyWith({
    int? id,
    String? oid,
    String? esId,
    List<dynamic>? resumes,
    User? user,
  }) =>
      AuthenticationObject(
        id: id ?? this.id,
        oid: oid ?? this.oid,
        esId: esId ?? this.esId,
        resumes: resumes ?? this.resumes,
        user: user ?? this.user,
      );

  factory AuthenticationObject.fromJson(String str) =>
      AuthenticationObject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthenticationObject.fromMap(Map<String, dynamic> json) =>
      AuthenticationObject(
        id: json["id"],
        oid: json["oid"],
        esId: json["es_id"],
        resumes: List<dynamic>.from(json["resumes"].map((x) => x)),
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "oid": oid,
        "es_id": esId,
        "resumes": List<dynamic>.from(resumes!.map((x) => x)),
        "user": user!.toMap(),
      };
}

class User {
  User({
    this.username,
    this.email,
    this.phoneNumber,
    this.name,
    this.url,
    this.photo,
  });

  String? username;
  String? email;
  String? phoneNumber;
  String? name;
  String? url;
  dynamic photo;

  User copyWith({
    String? username,
    String? email,
    String? phoneNumber,
    String? name,
    String? url,
    dynamic photo,
  }) =>
      User(
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        name: name ?? this.name,
        url: url ?? this.url,
        photo: photo ?? this.photo,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        url: json["url"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "name": name,
        "url": url,
        "photo": photo,
      };
}
