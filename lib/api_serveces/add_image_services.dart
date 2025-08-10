import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_api/src/request/model/uploader_params.dart';

class AddImageServices {
  static Future<String?> uploadFruitImage(File file) async {
    final _cloudinaryApiKey = dotenv.env['CLOUDINARY_API_KEY'];
    final _cloudinarySecretKey = dotenv.env['CLOUDINARY_SECRET_KEY'];
    //link formet cloudinary://<your_api_key>:<your_api_secret>@dd7p4r11l
    final _cloudinaryLink = Cloudinary.fromStringUrl(
      "cloudinary://$_cloudinaryApiKey:$_cloudinarySecretKey@dd7p4r11l",
    );

    final uploadRespond = await _cloudinaryLink.uploader().upload(
      file,
      params: UploadParams(uploadPreset: "GroceryMediaPresent", type: "raw"),
    );

    if (uploadRespond?.responseCode == 200) {
      final data =
          jsonDecode(uploadRespond!.rawResponse ?? '') as Map<String, dynamic>;
      final url = data['url'];
      return url;
    }

    return null;
  }
}
