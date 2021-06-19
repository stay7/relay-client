import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
