import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/models/settings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class _Define {
  final storage = GetStorage('Bevy');
  List<SettingsItemModel> items = [
    SettingsItemModel(
      icon: Icons.language,
      title: 'Idioma de la aplicación',
      subTitle: 'Sistema',
    ),
    SettingsItemModel(
      icon: Icons.help,
      title: 'Ayuda',
      subTitle: 'Contáctenos, política de privacidad',
    ),
  ];
}

class SettingsOptionHomeController extends GetxController with _Define {
  @override
  void onReady() {
    changeLanguage(storage.read<String>('language') ?? 'es');
    update();
    super.onReady();
  }

  bool activeLanguageTheSystem() {
    switch (Get.deviceLocale?.languageCode) {
      case 'es':
        return true;

      case 'en':
        return true;
      default:
        return false;
    }
  }

  changeLanguage(String code, {bool? system}) {
    for (var item in items) {
      if (item.icon == Icons.language) {
        switch (code) {
          case 'es':
            items[0].subTitle = 'Español';
            Get.updateLocale(const Locale('es'));
            break;

          case 'en':
            items[0].subTitle = 'Ingles';
            Get.updateLocale(const Locale('en'));
            break;
        }
        if (system == true) {
          items[0].subTitle = 'Sistema';
          storage.write('language', 'Sistema');
        }
      }
    }

    update();
  }

  contactar() {}
}
