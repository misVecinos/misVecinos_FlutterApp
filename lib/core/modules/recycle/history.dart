// To parse this JSON data, do
//
//     final recycleData = recycleDataFromMap(jsonString);

import 'dart:convert';

class History {
  History({required this.recycleData, required this.quantity});

  final List<RecycleData> recycleData;
  final Quantity quantity;

  //factory History.fromJson(String str) => History.fromMap(str);

  factory History.fromMap(Map<String, dynamic> json) => History(
      recycleData: RecycleData.fromMap(json) as List<RecycleData>,
      quantity: Quantity.fromMap(json));
}

class RecycleData {
  RecycleData({
    required this.id,
    required this.houseId,
    required this.quantityPet,
    required this.quantityAlum,
    required this.dateIn,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int houseId;
  final int quantityPet;
  final int quantityAlum;
  final DateTime dateIn;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory RecycleData.fromJson(String str) =>
      RecycleData.fromMap(json.decode(str));

  factory RecycleData.fromMap(Map<String, dynamic> json) => RecycleData(
        id: json["id"],
        houseId: json["house_id"],
        quantityPet: json["quantity_pet"],
        quantityAlum: json["quantity_alum"],
        dateIn: DateTime.parse(json["date_in"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Quantity {
  Quantity({
    required this.totalQuantityPet,
    required this.totalQuantityAlum,
  });

  final int totalQuantityPet;
  final int totalQuantityAlum;

  factory Quantity.fromJson(String str) => Quantity.fromMap(json.decode(str));

  factory Quantity.fromMap(Map<String, dynamic> json) => Quantity(
        totalQuantityPet: json["total_quantity_pet"],
        totalQuantityAlum: json["total_quantity_alum"],
      );
}
