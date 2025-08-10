import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/utils/api_path.dart';

class FruitApiServece {
  static final header = {
    'Content-Type': 'application/json',
    "Authorization": "Bearer ${dotenv.env['AIRTABLE_TOKEN']}",
  };
  static const url = '${ApiPath.airTableUrl}/${ApiPath.fruitAuth}';

  static Future<List<Fruitmodel>> getFruits() async {
    try {
      final response = await http.get(headers: header, Uri.parse(url));

      if (response.statusCode == 200) {
        final dataList = jsonDecode(response.body) as Map<String, dynamic>;

        final data = dataList['records'] as List<dynamic>;

        final fruitModelList = data.map((e) => Fruitmodel.formJson(e)).toList();

        return fruitModelList;
      } else {
        throw Exception(response.body);
      }
    } catch (a) {
      throw Exception(a);
    }
  }

  static Future<void> addFruit(Fruitmodel fruitModel) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(fruitModel.toJson()),
      );

      log(response.statusCode.toString());
      log(response.body);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  static Future<void> updateFruitDetails(Fruitmodel fruitmodel) async {
    final String newUrl = "$url/${fruitmodel.id}";

    try {
      final response = await http.patch(
        Uri.parse(newUrl),
        headers: header,
        body: jsonEncode(fruitmodel.toJsonUpdate()),
      );

      if (response.statusCode == 200) {
        log("deleteDone");
      }
    } catch (e) {
      log("Error occures");
    }
  }

  static Future<void> deleteFruits(Fruitmodel fruitmodel) async {
    final String newUrl = "$url/${fruitmodel.id}";

    try {
      final response = await http.delete(headers: header, Uri.parse(newUrl));

      log(response.statusCode.toString());
    } catch (e) {
      log("Error occures");
    }
  }
}
