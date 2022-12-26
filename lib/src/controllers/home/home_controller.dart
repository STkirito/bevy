import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class HomeController extends GetxController {
  cameraOptionAndNavigationToView(BuildContext context) async {
    final AssetEntity? entity = await CameraPicker.pickFromCamera(
      context,
      locale: const Locale('es', 'ES'),
    );
    if (entity != null) {
      Get.toNamed('/home/option/sharedimage', arguments: await entity.file);
    }
  }

  menuOption(int value) {
    switch (value) {
      case 0:
        Get.toNamed('/home/option/settings');
        break;
      case 1:
        Get.offAllNamed('/auth/login');
        break;
    }
  }
}
