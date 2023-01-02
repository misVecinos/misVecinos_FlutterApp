// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mis_vecinos_app/core/modules/recycle/history.dart';

class RecycleRepository {
//Pedir en futuro el id del usuario
  Future sendQuantity(int aluminium, int pet, DateTime time) async {
    //200--success
    try {
      final url =
          Uri.parse('https://mvadmin-3f4ug.ondigitalocean.app/api/v1/recycle');
      var response = await http.post(url, body: {
        "quantity_pet": "$pet",
        "quantity_alum": "$aluminium",
        "house_id": "1",
        "user_id": "1",
        "date_in":
            "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}"
      });
      if (response.statusCode == 200) {
        print('Success${response.statusCode}');
        return response.statusCode;
      } else {
        print(response.statusCode.toString());
      }
    } catch (error) {
      print('ERROR//////---- ${error.toString()}');
      return error;
    }
  }

  Future<History> getHistory() async {
    final url =
        Uri.parse('https://mvadmin-3f4ug.ondigitalocean.app/api/v1/recycle/1');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('Success History ///${response.statusCode}');
      var history = History.fromMap(json.decode(response.body));
      return history;
    } else {
      print(response.statusCode.toString());
      return History(data: []);
    }
  }
  //
}

class QuantityPetAl {
  String quantityPet;
  String quantityAlum;
  String houseId;
  String userId;
  String dateIn;

  QuantityPetAl({
    required this.quantityPet,
    required this.quantityAlum,
    required this.houseId,
    required this.userId,
    required this.dateIn,
  });
}
