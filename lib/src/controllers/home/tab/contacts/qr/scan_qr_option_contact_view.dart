import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/contacts.dart';
import 'package:bevy/src/models/contact_model.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class _Define {
  RxString code = ''.obs;
  ContactModel? contact;
}

class ScanQrOptionContactController extends GetxController with _Define {
  resultScan(Barcode barcode, MobileScannerArguments? args,
      {void Function()? result}) {
    if (barcode.rawValue == null) {
      debugPrint('Failed to scan Barcode');
    } else {
      if (code.isEmpty) {
        code.value = barcode.rawValue!;

        if (code.value.contains(
          RegExp('Bevy/id/'),
        )) {
          //print('recorte: ${code.replaceAll(RegExp('Bevy/id/'), '')}');
          if (viewContact(code.replaceAll(RegExp('Bevy/id/'), ''))) {
            result?.call();
          }

          //return true;
        } else {
          code.value = '';
          //return false;
        }
      }
    }
  }

  bool viewContact(String id) {
    for (var contact in contacts) {
      if (contact.id == id) {
        this.contact = contact;
        return true;
      }
    }
    return false;
  }

  addContact(String id) async {
    Get.showSnackbar(const GetSnackBar(
      title: 'Bevy',
      message: 'Agregando contacto, espere no salga de esta pantalla.',
      duration: Duration(milliseconds: 2500),
    ));
    return Future.delayed(Duration(milliseconds: 3000), () {
      return true;
    });
  }

  errorAddContact() {
    Get.showSnackbar(const GetSnackBar(
      title: 'Bevy',
      message: 'No se pudo agregar el contacto',
      duration: Duration(milliseconds: 2500),
    ));
  }
}
