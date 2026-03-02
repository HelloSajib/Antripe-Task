import 'dart:convert';

import 'package:flutter_task/features/home/domain/entities/contact_entity.dart';

class ContactsModel {
  final String? status;
  final String? message;
  final ContactsData? contactsData;

  ContactsModel({
    this.status,
    this.message,
    this.contactsData,
  });

  ContactsModel copyWith({
    String? status,
    String? message,
    ContactsData? contactsData,
  }) =>
      ContactsModel(
        status: status ?? this.status,
        message: message ?? this.message,
        contactsData: contactsData ?? this.contactsData,
      );

  factory ContactsModel.fromRawJson(String str) => ContactsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
    status: json["status"],
    message: json["message"],
    contactsData: json["data"] == null ? null : ContactsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": contactsData?.toJson(),
  };
}

class ContactsData {
  final List<Category>? categories;
  final List<Contact>? contacts;

  ContactsData({
    this.categories,
    this.contacts,
  });

  ContactsData copyWith({
    List<Category>? categories,
    List<Contact>? contacts,
  }) =>
      ContactsData(
        categories: categories ?? this.categories,
        contacts: contacts ?? this.contacts,
      );

  factory ContactsData.fromRawJson(String str) => ContactsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactsData.fromJson(Map<String, dynamic> json) => ContactsData(
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    contacts: json["contacts"] == null ? [] : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
  };

  ContactsEntity toEntity()=> ContactsEntity(
    categories: categories,
    contacts: contacts
  );

}

class Category {
  final String? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  Category copyWith({
    String? id,
    String? name,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Contact {
  final String? id;
  final bool? isEmpty;
  final String? name;
  final String? phone;
  final String? categoryId;
  final String? avatarUrl;
  final String? subtitle;
  final String? status;
  final DateTime? createdAt;

  Contact({
    this.id,
    this.isEmpty,
    this.name,
    this.phone,
    this.categoryId,
    this.avatarUrl,
    this.subtitle,
    this.status,
    this.createdAt,
  });

  Contact copyWith({
    String? id,
    bool? isEmpty,
    String? name,
    String? phone,
    String? categoryId,
    String? avatarUrl,
    String? subtitle,
    String? status,
    DateTime? createdAt,
  }) =>
      Contact(
        id: id ?? this.id,
        isEmpty: isEmpty ?? this.isEmpty,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        categoryId: categoryId ?? this.categoryId,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        subtitle: subtitle ?? this.subtitle,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Contact.fromRawJson(String str) => Contact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    isEmpty: json["isEmpty"],
    name: json["name"],
    phone: json["phone"],
    categoryId: json["categoryId"],
    avatarUrl: json["avatarUrl"],
    subtitle: json["subtitle"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isEmpty": isEmpty,
    "name": name,
    "phone": phone,
    "categoryId": categoryId,
    "avatarUrl": avatarUrl,
    "subtitle": subtitle,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}