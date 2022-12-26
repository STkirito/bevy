import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/controllers/home/tab/contacts/contacts_controller.dart';
import 'package:bevy/src/models/contact_model.dart';
import 'package:bevy/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  void initState() {
    Get.put(ContactsHomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
          child: const Icon(Icons.qr_code_scanner),
          onPressed: () {
            Get.toNamed('/home/contacs/contact/myqraddcontact');
          }),
      body: SizedBox(
        height: AwsScreenSize.height(100),
        width: AwsScreenSize.width(100),
        child: ContactListItem(),
      ),
    );
  }
}

class ContactListItem extends GetView<UserController> {
  ContactListItem({super.key});
  CollectionReference contactsReference =
      FirebaseFirestore.instance.collection('Contacts');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsHomeController>(builder: (controllerTwo) {
      return controllerTwo.contactss.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controllerTwo.contactlength(),
              itemBuilder: (context, index) {
                if (!controllerTwo.contactFilterDelete(index)) {
                  return ContactItem(controller: controllerTwo, index: index);
                } else {
                  return Container();
                }
              })
          : Container();
    });
  }
}

// ignore: must_be_immutable
class ContactItem extends StatelessWidget {
  ContactsHomeController controller;
  int index;
  ContactItem({required this.controller, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: PopupMenuButton(
        offset: const Offset(1, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color.fromRGBO(114, 162, 240, 94).withRed(1),
        child: CircleAvatar(
          /* child: Image.network(
            controller.contact(index)['avatar'],
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return child;
            },
            loadingBuilder: ((context, child, loadingProgress) {
              if (loadingProgress != null) {
                return Image.asset(
                  'assets/loading.gif',
                  fit: BoxFit.cover,
                );
              }
              return child;
            }),
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/errorImage.gif',
                fit: BoxFit.cover,
              );
            },
          ), */
          backgroundImage: NetworkImage(
            controller.contact(index)['avatar'],
          ),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 0,
              child: Row(
                children: const [
                  Icon(
                    Icons.qr_code,
                    color: Colors.white,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Compartir',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 1,
              child: Row(
                children: const [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ];
        },
        onSelected: (value) => controller.contactOption(value, index: index),
      ),
      title: Text(controller.contact(index)['name']),
      subtitle: Text(controller.contact(index)['message'] ?? ''),
      trailing: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color:
              controller.contact(index)['status'] ? Colors.green : Colors.red,
        ),
      ),
      onTap: () => controller.navigationToChat(controller.contact(index)['id']),
      //onLongPress: () {},
    );
  }
}
