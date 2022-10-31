import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viva_sport/models/matches/matches_model.dart';

import '../costansts/matches_api.dart';

class MatchesApi {
  Future getMatch(
      {required String dateFrom,
      required String dateTo,
      required String code}) async {
//List<Matches> list = [];
    http.Response response = await http.get(
        Uri.parse(
            "https://api.football-data.org/v4/competitions/$code/matches?dateTo=$dateTo&dateFrom=$dateFrom"),
        headers: {'X-Auth-Token': apiToken});

    if (response.statusCode == 200) {

        return MatchModel.fromJson(jsonDecode(response.body));

    } else {
      Get.snackbar("خطا", "يرجى التاكد من الانترنيت");
    }
  }
}
