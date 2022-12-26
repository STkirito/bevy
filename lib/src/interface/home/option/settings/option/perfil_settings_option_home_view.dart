import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/controllers/home/option/settings/option/perfil_settings_option_home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class PerfilSettingsOptionHomeView extends GetView<UserController> {
  final TextStyle style = const TextStyle(overflow: TextOverflow.ellipsis);
  const PerfilSettingsOptionHomeView({super.key});

  Future<dynamic> _name(
      BuildContext context, PerfilSettingsOptionHomeController perfil) {
    TextEditingController controller = TextEditingController();
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
            perfil.isKeyboardVisible(isKeyboardVisible);
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: perfil.mainAxisSize.value,
                children: [
                  Text(
                    'Canbiar nombre'.tr,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Ingrese aqui su nuevo nombre'.tr,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      isCollapsed: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AwsAnimationButton(
                    initIcon: const Icon(Icons.account_circle),
                    initLabel: Text('Canbiar'.tr),
                    actionsLabel: Text('Procesando'.tr),
                    actionsIcon: Image.asset('assets/cargando.gif'),
                    okLabel: Text('Canbiado'.tr),
                    sizeY: 45,
                    actions: () async =>
                        await perfil.changeName(controller.text),
                    ok: () => Get.back(),
                    error: () {},
                  ),
                ],
              ),
            );
          });
        });
  }

  Future<dynamic> _email(
      BuildContext context, PerfilSettingsOptionHomeController perfil) {
    TextEditingController controller = TextEditingController();
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
            perfil.isKeyboardVisible(isKeyboardVisible);
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: perfil.mainAxisSize.value,
                children: [
                  Text(
                    'Canbiar correo electrónico'.tr,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Ingrese aqui su nuevo correo electrónico'.tr,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      isCollapsed: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AwsAnimationButton(
                    initIcon: const Icon(Icons.email),
                    initLabel: Text('Canbiar'.tr),
                    actionsLabel: Text('Procesando'.tr),
                    actionsIcon: Image.asset('assets/cargando.gif'),
                    okLabel: Text('Canbiado'.tr),
                    sizeY: 45,
                    actions: () async =>
                        await perfil.changeEmail(controller.text),
                    ok: () => Get.back(),
                    error: () {},
                  ),
                ],
              ),
            );
          });
        });
  }

  Future<dynamic> _password(
      BuildContext context, PerfilSettingsOptionHomeController perfil) {
    TextEditingController controller = TextEditingController();
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
            perfil.isKeyboardVisible(isKeyboardVisible);
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: perfil.mainAxisSize.value,
                children: [
                  Text(
                    'Canbiar su contraseña'.tr,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Ingrese aqui su nueva contraseña'.tr,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      isCollapsed: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AwsAnimationButton(
                    initIcon: const Icon(Icons.account_circle),
                    initLabel: Text('Canbiar'.tr),
                    actionsLabel: Text('Procesando'.tr),
                    actionsIcon: Image.asset('assets/cargando.gif'),
                    okLabel: Text('Canbiado'.tr),
                    sizeY: 45,
                    actions: () async {
                      return await Future.delayed(
                          const Duration(milliseconds: 3000), () {
                        return true;
                      });
                    },
                    ok: () => Get.back(),
                    error: () {},
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return GetBuilder<PerfilSettingsOptionHomeController>(
        init: Get.put(PerfilSettingsOptionHomeController()),
        builder: (perfil) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
              leading: CupertinoButton(
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () => Get.back()),
              title: Text('Ajustes de perfil'.tr),
            ),
            body: Obx(() {
              return Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AwsScreenSize.height(29),
                    width: AwsScreenSize.width(100),
                    child: Center(
                      child: SizedBox(
                        height: AwsScreenSize.height(29),
                        width: AwsScreenSize.width(38),
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              //color: Colors.blue,
                              padding: const EdgeInsets.only(bottom: 30),
                              height: AwsScreenSize.height(29),
                              width: AwsScreenSize.width(35),
                              child: CircleAvatar(
                                /* child: Image.file(
                            File(controller.user.value.avatar),
                            fit: BoxFit.cover,
                          ), */
                                backgroundImage:
                                    NetworkImage(controller.user.value.avatar),
                                maxRadius: 80,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 1,
                              child: FloatingActionButton(
                                child: const Icon(Icons.add_a_photo),
                                onPressed: () => perfil.changeAvatar(
                                    context, 'https://picsum.photos/200'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: AwsScreenSize.width(80),
                    child: FittedBox(
                      child: Column(
                        children: [
                          CupertinoButton(
                            color: Colors.black.withOpacity(.4),
                            child: Row(
                              children: [
                                Icon(Icons.account_circle),
                                const SizedBox(width: 5),
                                Text(controller.user.value.name, style: style),
                              ],
                            ),
                            onPressed: () {
                              _name(context, perfil);
                            },
                          ),
                          const SizedBox(height: 10),
                          CupertinoButton(
                            color: Colors.black.withOpacity(.4),
                            child: Row(
                              children: [
                                Icon(Icons.email),
                                const SizedBox(width: 5),
                                Text(controller.user.value.email, style: style),
                              ],
                            ),
                            onPressed: () {
                              _email(context, perfil);
                            },
                          ),
                          const SizedBox(height: 10),
                          CupertinoButton(
                            color: Colors.black.withOpacity(.4),
                            child: Row(
                              children: [
                                Icon(Icons.lock),
                                const SizedBox(width: 5),
                                Text(
                                    controller.user.value.password
                                        .toString()
                                        .replaceAll(RegExp(r'[a-z]'), '*')
                                        .replaceAll(RegExp(r'[0-9]'), '*'),
                                    style: style),
                              ],
                            ),
                            onPressed: () {
                              _password(context, perfil);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        });
  }
}
