import 'dart:convert';
import 'package:bevy/src/key/key.dart';
import 'package:bevy/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/Usuarios.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _Define {
  final storage = GetStorage('Bevy');
  Rx<MainAxisSize> mainAxisSize = MainAxisSize.min.obs;
  TextEditingController email = TextEditingController();
  TextEditingController emailRecover = TextEditingController();
  TextEditingController password = TextEditingController();
  RxString logins = 'verificando'.obs;
  CollectionReference userReference =
      FirebaseFirestore.instance.collection('Usuarios');
}

class LoginAuthController extends GetxController with _Define {
  validationIsEmail(String? value) {
    if (!GetUtils.isEmail(value?.replaceAll(" ", "") ?? '')) {
      return 'Correo electrónico no válido'.tr;
    }
    return null;
  }

  validationIsPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su contraseña'.tr;
    }

    if (value.length < 6) {
      return 'La contraseña debe de ser de 6 caracteres'.tr;
    }

    return null;
  }

  isKeyboardVisible(bool isKeyboardVisible) {
    if (isKeyboardVisible) {
      mainAxisSize.value = MainAxisSize.max;
    } else {
      mainAxisSize.value = MainAxisSize.min;
    }
  }

  loginProcess(GlobalKey<FormState>? formKey) async {
    UserController createUser = Get.find<UserController>();
    if (formKey!.currentState!.validate()) {
      final Map<String, dynamic> authData = {
        'email': email.text,
        'password': password.text,
      };
      final url = Uri.https(
          baseUrl, '/v1/accounts:signInWithPassword', {'key': firebaseToken});
      final resp = await http.post(url, body: json.encode(authData));
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('idToken')) {
        //await storage.write('token', decodeResp['idToken']);

        await userReference.get().then((value) async {
          QuerySnapshot collection = value;
          for (var element in collection.docs) {
            Map<String, dynamic> data = element.data() as Map<String, dynamic>;
            await storage.write('token', element.id);
            if (data['email'] == email.text) {
              createUser.initUser(UserModel(
                id: element.id,
                avatar: data['avatar'],
                name: data['name'],
                email: data['email'],
                password: data['password'],
                idcontacts: List<String>.from(data['idContacts'] as List),
                idcanvas: List<String>.from(data['idCanvas'] as List),
                idSettings: '0',
                idContact: data['idContact'],
              ));
            }
          }
        });

        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  errorLogin() {
    email.clear();
    password.clear();
    if (kDebugMode) {
      print('login error');
    }
  }

  recoverAccount() async {
    return await Future.delayed(const Duration(milliseconds: 2000), () {
      return true;
    });
  }

  errorRecoverAccount() => emailRecover.clear();

  navigationToHome() => Get.offNamed('/home');
  navigationToRegister() {
    email.clear();
    password.clear();
    Get.toNamed('/auth/register');
  }
}
