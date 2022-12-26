import 'dart:io';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/contacts.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/models/contact_model.dart';
import 'package:bevy/src/models/user_model.dart';

class _Define {
  final UserController _controllerUser = Get.find<UserController>();
  final RxList<ContactModel> _contacts = <ContactModel>[].obs;
}

class SharedImageOptionHomeController extends GetxController with _Define {
  @override
  void onInit() {
    Rx<UserModel> user = _controllerUser.user;
    for (var idcontact in user.value.idcontacts) {
      for (ContactModel contact in contacts) {
        if (idcontact == contact.id) {
          _contacts.add(contact);
        }
      }
    }
    super.onInit();
  }

  int contactlength() => _contacts.length;
  Map contact(int index) {
    return {
      'id': _contacts[index].id,
      'avatar': _contacts[index].avatar,
      'name': _contacts[index].name,
      'status': _contacts[index].status,
    };
  }

  contactFilterDelete(int index) {
    return _contacts[index].delete;
  }

  contactDelete(int index) {
    _contacts[index].delete = true;
    update();
  }

  addPublicCanvas(File? file) {}

  inputMessageImage(String id, File? file) {}
}
