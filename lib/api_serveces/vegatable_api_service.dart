import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/model/vegatable_model.dart';
import 'package:new_app/utils/api_path.dart';

class VegatableApiService {
  static final header = {
    'Content-Type': 'application/json',
    "Authorization": "Bearer ${dotenv.env['AIRTABLE_TOKEN']}",
  };
  static const url = '${ApiPath.airTableUrl}/${ApiPath.vegatableAuth}';

  static Future<List<VegatableModel>> getVegataleList() async {
    try {
      final respon = await http.get(Uri.parse(url), headers: header);

      if (respon.statusCode == 200) {
        final Map<String, dynamic> dataList = jsonDecode(respon.body);
        final List<dynamic> data = dataList["records"];

        final vegModelList =
            data.map((e) => VegatableModel.formJson(e)).toList();

        return vegModelList;
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> addVegatable(VegatableModel vegatableModel) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: vegatableModel.toJson(),
      );

      log(response.statusCode.toString());
      log(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> updateVegatable(VegatableModel vegModel) async {
    String newUrl = "$url/${vegModel.id}";
    try {
      final respon = await http.patch(
        Uri.parse(newUrl),
        headers: header,
        body: jsonEncode(vegModel.toJsonUpdate()),
      );

      log(respon.statusCode.toString());
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> deleteVegatale(VegatableModel vegModel) async {
    String newUrl = "$url/${vegModel.id}";
    try {
      final respon = await http.delete(Uri.parse(newUrl), headers: header);

      log(respon.statusCode.toString());
    } catch (e) {
      throw Exception(e);
    }
  }
}
