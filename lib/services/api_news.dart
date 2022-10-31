import 'package:get/get.dart';
import 'package:viva_sport/models/model_news.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../costansts/api_news.dart';

class NewsServicesApi {
  Future getDataApiNews() async {
    http.Response response = await http.get(Uri.parse(baseUrlApiNews));
    if (response.statusCode == 200) {
      try {
        return ListModelNews.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar("ERROR", e.toString());
      }
    }
  }
}
