import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/controllers/home/option/settings/settings_option_home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class _Define {
  CollectionReference userReference =
      FirebaseFirestore.instance.collection('Usuarios');
  UserController user = Get.find<UserController>();
  SettingsOptionHomeController settings =
      Get.find<SettingsOptionHomeController>();
  Rx<MainAxisSize> mainAxisSize = MainAxisSize.min.obs;
}

class PerfilSettingsOptionHomeController extends GetxController with _Define {
  isKeyboardVisible(bool isKeyboardVisible) {
    if (isKeyboardVisible) {
      mainAxisSize.value = MainAxisSize.max;
    } else {
      mainAxisSize.value = MainAxisSize.min;
    }
  }

  changeAvatar(BuildContext context, String avatar) async {
    bool complet = false;
    final AssetEntity? entity = await CameraPicker.pickFromCamera(
      context,
      locale: const Locale('es', 'ES'),
    );
    await userReference.doc(user.user.value.id).update({
      'avatar': avatar,
    }).catchError((error) {
      complet = false;
    }).whenComplete(() => complet = true);
    if (complet) {
      user.user.value.avatar = avatar;
      user.update();
      update();
      settings.update();
    }
    return complet;
  }

  changeName(String name) async {
    bool complet = false;
    await userReference.doc(user.user.value.id).update({
      'name': name,
    }).catchError((error) {
      complet = false;
    }).whenComplete(() => complet = true);
    if (complet) {
      user.user.value.name = name;
      user.update();
      update();
      settings.update();
    }
    return complet;
  }

  changeEmail(String email) async {
    bool complet = false;
    await userReference.doc(user.user.value.id).update({
      'email': email,
    }).catchError((error) {
      complet = false;
    }).whenComplete(() => complet = true);
    if (complet) {
      user.user.value.email = email;
      user.update();
      update();
      settings.update();
    }
    return complet;
  }

  changePassword(String password) async {
    bool complet = false;
    await userReference.doc(user.user.value.id).update({
      'password': password,
    }).catchError((error) {
      complet = false;
    }).whenComplete(() => complet = true);
    if (complet) {
      user.user.value.password = password;
      user.update();
      update();
      settings.update();
    }
    return complet;
  }
}
