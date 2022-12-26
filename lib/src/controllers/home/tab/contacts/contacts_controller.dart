import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/contacts.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/models/contact_model.dart';
import 'package:bevy/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsHomeController extends GetxController {
  final UserController user = Get.find<UserController>();
  RxList<ContactModel> contactss = <ContactModel>[].obs;
  CollectionReference contactsReference =
      FirebaseFirestore.instance.collection('Contacts');

  @override
  void onInit() async {
    /* Rx<UserModel> _user = user.user;
    for (var id in _user.value.idcontacts) {
      await contactsReference.get().then((value) async {
        QuerySnapshot collection = value;
        for (var element in collection.docs) {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;

          if (element.id == id) {
            contactss.insert(
                0,
                ContactModel(
                    id: element.id,
                    avatar: data['avatar'],
                    name: data['name'],
                    idChat: data['idChat'],
                    idCanvas: data['idCanvas'],
                    status: data['status'],
                    delete: data['delete']));
            update();
            
          }
        }
      });
    } */
    super.onInit();
  }

  getContacts(String id) async {
    await contactsReference.get().then((value) async {
      QuerySnapshot collection = value;
      for (var element in collection.docs) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;

        if (element.id == id) {
          return ContactModel(
              id: element.id,
              avatar: data['avatar'],
              name: data['name'],
              idChat: data['idChat'],
              idCanvas: data['idCanvas'],
              status: data['status'],
              delete: data['delete']);
        }
      }
    });
  }

  @override
  void onReady() async {
    Rx<UserModel> _user = user.user;
    for (var id in _user.value.idcontacts) {
      await contactsReference.get().then((value) async {
        QuerySnapshot collection = value;
        for (var element in collection.docs) {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;

          if (element.id == id) {
            contactss.insert(
                0,
                ContactModel(
                    id: element.id,
                    avatar: data['avatar'],
                    name: data['name'],
                    idChat: data['idChat'],
                    idCanvas: data['idCanvas'],
                    status: data['status'],
                    delete: data['delete']));
            update();
          }
        }
      });
    }
    /* Rx<UserModel> _user = user.user;
    for (var idcontact in _user.value.idcontacts) {
      for (ContactModel contact in contacts) {
        print('idContacts:${contact.id}');
        if (idcontact == contact.id) {
          contactss.add(contact);
        }
      }
    } */
    super.onReady();
  }

  int contactlength() => contactss.value.length;
  Map contact(int index) {
    return {
      'id': contactss[index].id,
      'avatar': contactss[index].avatar,
      'name': contactss[index].name,
      'idChat': contactss[index].idChat,
      'message': contactss[index].message,
      'status': contactss[index].status,
    };
  }

  contactFilterDelete(int index) {
    return contactss[index].delete;
  }

  contactDelete(int index) {
    contactss[index].delete = true;
    update();
  }

  contactOption(int value, {required int index}) {
    if (value == 0) {
      Get.toNamed('/home/contacs/contact/shared', arguments: {
        'id': contact(index)['id'],
        'avatar': contact(index)['avatar'],
        'name': contact(index)['name'],
      });
    }
    if (value == 1) {
      contactDelete(index);
    }
  }

  navigationToChat(String id) => Get.toNamed(
        '/home/contacs/contact/Chat',
        arguments: AwsArguments(map: {'id': id, 'idUser': user.user.value.id}),
      );
}
