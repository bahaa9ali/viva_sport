import 'package:get/get.dart';
import 'package:viva_sport/controllers/match_controller.dart';

class MatchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MatchController>(MatchController());
  }
}
