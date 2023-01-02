// To parse this JSON data, do
//
//     final history = historyFromMap(jsonString);
import 'dart:convert';

class History {
  History({
    required this.data,
  });

  final List<RecycleRegister> data;

  factory History.fromJson(String str) => History.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory History.fromMap(Map<String, dynamic> json) => History(
        data: List<RecycleRegister>.from(
            json["data"].map((x) => RecycleRegister.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class RecycleRegister {
  RecycleRegister({
    required this.houseId,
    required this.quantityPet,
    required this.quantityAlum,
    required this.dateIn,
    required this.userId,
  });

  final int houseId;
  final int quantityPet;
  final int quantityAlum;
  final DateTime dateIn;
  final int userId;

  factory RecycleRegister.fromJson(String str) =>
      RecycleRegister.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecycleRegister.fromMap(Map<String, dynamic> json) => RecycleRegister(
        houseId: json["house_id"],
        quantityPet: json["quantity_pet"],
        quantityAlum: json["quantity_alum"],
        dateIn: DateTime.parse(json["date_in"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "house_id": houseId,
        "quantity_pet": quantityPet,
        "quantity_alum": quantityAlum,
        "date_in":
            "${dateIn.year.toString().padLeft(4, '0')}-${dateIn.month.toString().padLeft(2, '0')}-${dateIn.day.toString().padLeft(2, '0')}",
        "user_id": userId,
      };
}
