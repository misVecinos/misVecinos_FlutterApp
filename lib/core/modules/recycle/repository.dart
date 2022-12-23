// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:mis_vecinos_app/core/modules/recycle/history.dart';

class RecycleRepository {
//Pedir en futuro el id del usuario
  Future sendQuantity(int aluminium, int pet) async {
    //200--success
    try {
      final url =
          Uri.parse('https://mvadmin-3f4ug.ondigitalocean.app/api/v1/recycle');
      var response = await http.post(url, body: {
        "quantity_pet": "$pet",
        "quantity_alum": "$aluminium",
        "house_id": "1",
        "user_id": "1",
        "date_in": "2022-12-18"
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
      var history = History.fromJson(response.body);
      return history;
    } else {
      print(response.statusCode.toString());
      return History(
          currentPage: 0,
          data: [],
          firstPageUrl: '',
          from: 0,
          lastPage: 0,
          lastPageUrl: '',
          links: [],
          nextPageUrl: 0,
          path: '',
          perPage: 0,
          prevPageUrl: 0,
          to: 0,
          total: 0);
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
