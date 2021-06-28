import 'package:get/get.dart';

class ConfigController extends GetxController {
  RxBool isKeepAddWord = true.obs;

  switchKeepAddWord() {
    isKeepAddWord.value = !isKeepAddWord.value;
  }
}
