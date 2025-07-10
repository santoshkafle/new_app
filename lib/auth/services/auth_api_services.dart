import 'dart:convert';
import 'dart:developer';
import 'package:new_app/auth/models/auth_model.dart';
import 'package:new_app/utils/api_path.dart';
import 'package:http/http.dart' as http;

class AuthApiServices {
  static const header = {'Content-Type': 'application/json'};
  static const url = '${ApiPath.baseUrl}/${ApiPath.auth}';

  static Future<List<AuthModel>> getUsers() async {
    try {
      final response = await http.get(headers: header, Uri.parse(url));

      if (response.statusCode == 200) {
        final dataList = jsonDecode(response.body) as List<dynamic>?;

        final authModelList =
            dataList?.map((e) => AuthModel.formJson(e)).toList() ?? [];

        return authModelList;
      } else {
        return [];
      }
    } catch (e) {
      log("Error ${e.toString()}");
      return [];
    }
  }

  static Future<void> createUser(AuthModel authModel) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(authModel.toJson()),
      );

      log(response.statusCode.toString());
      log(response.body);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }

  static Future<void> editUserAccount(AuthModel auth) async {
    final String newUrl = "$url/${auth.id}";

    try {
      final response = await http.put(
        Uri.parse(newUrl),
        headers: header,
        body: jsonEncode(auth.toJson()),
      );

      log(response.body);
      log(response.statusCode.toString());
    } catch (e) {
      log("Error ${e.toString()}");
    }
  }

  static Future<void> deleteUser(AuthModel auth) async {
    final String newUrl = "$url/${auth.id}";

    try {
      final response = await http.delete(headers: header, Uri.parse(newUrl));

      log(response.body);
    } catch (e) {
      log("Error ${e.toString()}");
    }
  }
}
