import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viva_sport/models/matches/scoreboard_model.dart';
import 'dart:convert';

import '../controllers/person_controller.dart';
import '../costansts/matches_api.dart';

class ScorBoardServies {
  Future getScorBoard(String code) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://api.football-data.org/v4/competitions/$code/standings"),
        headers: {'X-Auth-Token': apiToken});

    if (response.statusCode == 200) {

        return ScorBoardModel.fromJson(jsonDecode(response.body));

    } else {
      Get.snackbar("خطا", "يرجى التاكد من الانترنيت");
    }
  }
}
