import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/Usuarios.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class _Define {
  final storage = GetStorage('Bevy');
  CollectionReference userReference =
      FirebaseFirestore.instance.collection('Usuarios');
}

class LoadingAuthController extends GetxController with _Define {
  Future<bool> checkToken() async {
    return await Future.delayed(const Duration(milliseconds: 3500), () async {
      UserController createUser = Get.find<UserController>();
      final token = storage.read('token');
      if (token == null || token.isEmpty) {
        return false;
      }
      await userReference.get().then((value) {
        QuerySnapshot collection = value;
        for (var element in collection.docs) {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;
          if (element.id == token) {
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
    });
  }

  navigationToHome() => Get.offAllNamed('/home');

  navigationToLogin() => Get.offAllNamed('/auth/login');
}
