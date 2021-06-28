import 'package:get/get.dart';
import 'package:relay/provider/preference_provider.dart';

class ConfigController extends GetxController {
  final _preferenceProvider = PreferenceProvider();
  late RxBool isKeepAddWord;

  @override
  onInit() {
    isKeepAddWord = _preferenceProvider.loadKeepAddWord().obs;
    super.onInit();
  }

  switchKeepAddWord() {
    isKeepAddWord.value = !isKeepAddWord.value;
    _preferenceProvider.saveKeepAddWord(isKeepAddWord.value);
  }
}
