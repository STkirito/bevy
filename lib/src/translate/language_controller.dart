import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<LanguageModel> languages = [
  LanguageModel('English', 'en_US'),
  LanguageModel('Spanish', 'es'),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}

class LanguajeController extends GetxController {
  var selectedLanguage = 'en_US'.obs;

/* var selectedLanguage = Get.locale?.languageCode.obs; */
  set changeLanguage(String lang) {
    Locale locale = Locale(lang);
    Get.updateLocale(locale);
    selectedLanguage.value = lang;

    //print();
    if (kDebugMode) {
      print(selectedLanguage.value);
    }
  }
}
