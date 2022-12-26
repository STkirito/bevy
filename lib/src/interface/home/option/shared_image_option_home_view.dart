import 'dart:io';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/home/option/shared/shared_image_option_home_controller.dart';
import 'package:bevy/src/interface/shared/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedImageOptionView extends StatelessWidget {
  final File _file = Get.arguments;
  SharedImageOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return GetBuilder(
        init: Get.put(SharedImageOptionHomeController()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
              leading: CupertinoButton(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () => Get.back(),
              ),
              title: Text('Compartir'.tr),
            ),
            body: SizedBox(
              height: AwsScreenSize.height(100),
              width: AwsScreenSize.width(100),
              child: _SharedImageListItem(_file),
            ),
          );
        });
  }
}

class _SharedImageListItem extends GetView<SharedImageOptionHomeController> {
  final File? _file;
  const _SharedImageListItem(File? file) : _file = file;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: CupertinoButton.filled(
              child: const Text('Publicar canvas'),
              onPressed: () => controller.addPublicCanvas(_file)),
        ),
        const Divider(),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Enviar a un contacto'.tr,
                style: const TextStyle(fontSize: 20),
              ),
            )),
        Expanded(child: _ContactListItem(_file)),
      ],
    );
  }
}

class _ContactListItem extends GetView<SharedImageOptionHomeController> {
  final File? _file;
  const _ContactListItem(File? file) : _file = file;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.contactlength(),
        itemBuilder: (context, index) {
          if (!controller.contactFilterDelete(index)) {
            return Contact(
              avatar: controller.contact(index)['avatar'],
              name: controller.contact(index)['name'],
              status: controller.contact(index)['status'],
              onTap: () => controller.inputMessageImage(
                  controller.contact(index)['id'], _file),
            );
          } else {
            return Container();
          }
        });
  }
}
