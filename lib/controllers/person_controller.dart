import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viva_sport/costansts/matches_api.dart';
import 'package:viva_sport/db/token.dart';
import 'package:viva_sport/views/pages/matches.dart';

class PersonController extends GetxController {


  // late String token;
  changeToken(String token) {
    apiToken = token;
    storage.write("token", token);

    Get.offAll(() => MatchesScreen());
    update();
  }

  removeToken() {
    storage.remove("token");

    update();
  }
}
