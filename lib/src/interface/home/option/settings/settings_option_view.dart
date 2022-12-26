import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/controllers/home/option/settings/settings_option_home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsOptionView extends GetView {
  const SettingsOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return GetBuilder(
        init: Get.put(SettingsOptionHomeController()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
              leading: CupertinoButton(
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () => Get.back()),
              title: Text('Ajustes'.tr),
            ),
            body: SizedBox(
              height: AwsScreenSize.height(100),
              width: AwsScreenSize.width(100),
              child: const SettingsListItem(),
            ),
          );
        });
  }
}

class SettingsAccount extends GetView {
  const SettingsAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Obx(
          () => CircleAvatar(
            backgroundImage: NetworkImage(controller.user.value.avatar),
            radius: 50,
          ),
        ),
        title: Obx(() => Text(controller.user.value.name)),
        trailing: CupertinoButton(
            child: const Icon(
              Icons.info,
              color: Color.fromRGBO(114, 162, 240, 94),
              size: 35,
            ),
            onPressed: () => Get.toNamed('/home/option/settings/info')),
        onTap: () => Get.toNamed('/home/option/settings/perfil'),
      );
    });
  }
}

class SettingsListItem extends GetView<SettingsOptionHomeController> {
  const SettingsListItem({super.key});

  Future<dynamic> _help(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Contactar'.tr,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Ingrese aqui su motivo de este mensaje'.tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: AwsScreenSize.height(30),
                  width: AwsScreenSize.width(100),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      isCollapsed: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Ingrese su mensaje aqui'.tr,
                    ),
                    maxLength: 500,
                    maxLines: null,
                    expands: true,
                  ),
                ),
                AwsAnimationButton(
                  initIcon: const Icon(Icons.email_outlined),
                  initLabel: Text('Enviar'.tr),
                  actionsLabel: Text('Procesando'.tr),
                  actionsIcon: Image.asset('assets/cargando.gif'),
                  okLabel: Text('Enviado'.tr),
                  sizeY: 45,
                  actions: () async {
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Bevy',
                      message:
                          'El proceso sea iniciado, no cierre esta pantalla hasta terminar.',
                      duration: Duration(milliseconds: 2500),
                    ));
                    return await Future.delayed(
                        const Duration(milliseconds: 3000), () {
                      return true;
                    });
                  },
                  ok: () {},
                  error: () {},
                ),
                CupertinoButton(
                    child: Text('política de privacidad'.tr), onPressed: () {}),
              ],
            ),
          );
        });
  }

  Future<dynamic> _changeLanguage(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Cambiar de lenguage'.tr),
                CupertinoButton(
                  child: const Text('Español'),
                  onPressed: () {
                    controller.changeLanguage('es');
                  },
                ),
                CupertinoButton(
                  child: const Text('Ingles'),
                  onPressed: () {
                    controller.changeLanguage('en');
                  },
                ),
                CupertinoButton(
                  onPressed: controller.activeLanguageTheSystem()
                      ? () {
                          controller.changeLanguage(
                              Get.deviceLocale!.languageCode,
                              system: true);
                        }
                      : null,
                  child: Text('Idioma del sistema'.tr),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        const SettingsAccount(),
        const Divider(),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(controller.items[index].icon),
                  title: Text(controller.items[index].title.toString()),
                  subtitle: controller.items[index].subTitle != null
                      ? Text(controller.items[index].subTitle.toString())
                      : null,
                  onTap: () {
                    switch (index) {
                      case 0:
                        _changeLanguage(context);
                        break;
                      case 1:
                        _help(context);
                        break;
                    }
                  },
                );
              }),
        ),
      ],
    );
  }
}
