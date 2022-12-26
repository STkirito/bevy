import 'dart:convert';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/Usuarios.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/key/key.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class _Define {
  final storage = GetStorage('Bevy');
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool contract = false.obs;
  CollectionReference userReference =
      FirebaseFirestore.instance.collection('Usuarios');
}

class RegisterAuthController extends GetxController with _Define {
  validateIsName(String value) {
    if (value.isEmpty) {
      return 'Ingrese un nombre'.tr;
    }
    return null;
  }

  validateIsEmail(String? value) {
    if (!GetUtils.isEmail(value?.replaceAll(" ", "") ?? '')) {
      return 'Correo electrónico no válido'.tr;
    }
    return null;
  }

  validateIsPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su contraseña'.tr;
    }

    if (value.length < 6) {
      return 'La contraseña debe de ser de 6 caracteres'.tr;
    }

    return null;
  }

  validateContract() {
    contract.value = !contract.value;
  }

  registrationProcess(GlobalKey<FormState>? formKey) async {
    if (formKey!.currentState!.validate() && contract.value) {
      storage.remove('token');
      final Map<String, dynamic> authData = {
        'email': email.text,
        'password': password.text,
      };
      final url =
          Uri.https(baseUrl, '/v1/accounts:signUp', {'key': firebaseToken});
      final resp = await http.post(url, body: json.encode(authData));
      final Map<String, dynamic> decodeResp = json.decode(resp.body);
      if (decodeResp.containsKey('idToken')) {
        await storage.write('token', decodeResp['idToken']);
        UserController createUser = Get.find<UserController>();
        createUser.initUser(users[0]);

        DocumentReference? op = await userReference.add(
          {
            'name': name.text,
            'email': email.text,
            'password': password.text,
            'idContacts': ['adwvOhfNIZGIptpfUgUV'],
            'idCanvas': ['1'],
            'idContact': '1',
            'avatar': 'https://picsum.photos/200',
          },
        ).then((DocumentReference value) async {
          /* Map<String, dynamic> data = value.data() as Map<String, dynamic>;
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
                idSettings: '0'));
          } */
        }).catchError((error) {
          return null;
        });
        if (op == null) {
          return false;
        }

        return true;
      } else {
        return false;
      }
    } else {
      print('error de comprobación de form');
      return false;
    }
  }

  errorRegistration() {
    name.clear();
    email.clear();
    password.clear();
    contract.value = false;
  }

  navigationToHome() => Get.offNamed('/home');
}
