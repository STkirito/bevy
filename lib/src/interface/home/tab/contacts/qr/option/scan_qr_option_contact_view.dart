import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/home/tab/contacts/qr/scan_qr_option_contact_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrOptionContactView extends GetView {
  const ScanQrOptionContactView({super.key});

  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();

    return GetBuilder(
        init: Get.put(ScanQrOptionContactController()),
        builder: (controller) {
          return Scaffold(
            body: MobileScanner(
              allowDuplicates: true,
              controller: cameraController,
              onDetect: (barcode, args) => controller.resultScan(barcode, args,
                  result: () => _addSubView(context, controller)),
              /* onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  if (controller.code.isEmpty) {
                    code.value = barcode.rawValue!;

                    if (code.value.contains(
                      RegExp('Bevy/'),
                    )) {
                      
                    } else {
                      code.value = '';
                    }
                  }
                }
              }, */
            ),
          );
        });
  }

  Future<dynamic> _addSubView(
      BuildContext context, ScanQrOptionContactController controller) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white.withOpacity(.7),
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              //mainAxisSize: controller.mainAxisSize.value,
              children: [
                Text('Agregar Nuevo Contacto'.tr),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      //color: Colors.blue,
                      padding: const EdgeInsets.only(bottom: 30),
                      height: AwsScreenSize.height(29),
                      width: AwsScreenSize.width(100),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(controller.contact!.avatar),
                        /* backgroundImage:
                          AssetImage(controller.user.value.avatar), */
                        maxRadius: 80,
                      ),
                    ),
                    Text(
                      controller.contact!.name,
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton.filled(
                        child: Text('regresar'.tr),
                        onPressed: () async {
                          /* reset.value = true;
                           */
                          controller.code.value = '';
                          Get.back();
                        }),
                    SizedBox(width: 10),
                    AwsAnimationButton(
                      initLabel: Text('Agregar'.tr),
                      initIcon: const Icon(Icons.account_circle),
                      actionsIcon: Image.asset('assets/cargando.gif'),
                      actionsLabel: Text('Agregando'.tr),
                      okLabel: Text('Agregado'.tr),
                      sizeY: 45,
                      actions: () async =>
                          await controller.addContact(controller.code.value),
                      ok: () => Get.back(),
                      error: () => controller.errorAddContact(),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
