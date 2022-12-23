// To parse this JSON data, do
//
//     final history = historyFromMap(jsonString);

import 'dart:convert';

class History {
  History({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<RecycleRegister> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory History.fromJson(String str) => History.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory History.fromMap(Map<String, dynamic> json) => History(
        currentPage: json["current_page"],
        data: List<RecycleRegister>.from(
            json["data"].map((x) => RecycleRegister.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class RecycleRegister {
  RecycleRegister({
    required this.id,
    required this.houseId,
    required this.quantityPet,
    required this.quantityAlum,
    required this.dateIn,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int houseId;
  int quantityPet;
  int quantityAlum;
  DateTime dateIn;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory RecycleRegister.fromJson(String str) =>
      RecycleRegister.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecycleRegister.fromMap(Map<String, dynamic> json) => RecycleRegister(
        id: json["id"],
        houseId: json["house_id"],
        quantityPet: json["quantity_pet"],
        quantityAlum: json["quantity_alum"],
        dateIn: DateTime.parse(json["date_in"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "house_id": houseId,
        "quantity_pet": quantityPet,
        "quantity_alum": quantityAlum,
        "date_in":
            "${dateIn.year.toString().padLeft(4, '0')}-${dateIn.month.toString().padLeft(2, '0')}-${dateIn.day.toString().padLeft(2, '0')}",
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String? url;
  String label;
  bool active;

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
