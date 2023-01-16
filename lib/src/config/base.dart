import 'package:flutter_pagination/src/controllers/config_contronner.dart';
import 'package:flutter_pagination/src/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Base {
  //********** All Controlers *****************
  final configC = Get.put(ConfigController());
  final homeC = Get.put(HomeController());
}
