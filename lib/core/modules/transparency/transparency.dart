class Ingreso {
  int id;
  int houseId;
  int quantity;
  int monthMaintanance;
  int statusRevenueId;

  Ingreso({
    required this.id,
    required this.houseId,
    required this.quantity,
    required this.monthMaintanance,
    required this.statusRevenueId,
  });
}

class Egreso {
  int id;
  int housingId;
  String name;
  int quantity;
  String dateExpanse;
  String image;

  Egreso({
    required this.id,
    required this.housingId,
    required this.name,
    required this.quantity,
    required this.dateExpanse,
    required this.image,
  });
}
