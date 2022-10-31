import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchController extends GetxController {
  int currnt = 0;
  int indexed = 0;

  String time = DateFormat('yyyy-MM-dd').format(DateTime.now());

  changeStats(int intStats) {
    currnt = intStats;

    update();
  }

  changeDataTimeInCremet(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(time),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (dateTime == null) return;

    time = DateFormat('yyyy-MM-dd').format(dateTime);
    update();
  }

  changeBottomNavigationBar(int index) {
    indexed = index;
    update();
  }
}
