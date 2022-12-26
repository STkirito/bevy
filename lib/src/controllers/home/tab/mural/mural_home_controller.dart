import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/canvas.dart';

import 'package:bevy/src/bd/contacts.dart' as contactsbd;
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/generator/uuid.dart';
import 'package:bevy/src/models/canvas_model.dart';
import 'package:bevy/src/models/contact_model.dart';
import 'package:bevy/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class MuralHomeController extends GetxController {
  UserController user = Get.find<UserController>();
  RxList<CanvasModel> canvas = <CanvasModel>[].obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    canvas.value = <CanvasModel>[];
    canvasInit();
    //canvas.shuffle();
    //canvas.shuffle();
    // if failed,use refreshFailed()
    update();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    canvasInit();

    // if failed,use loadFailed(),if no data return,use LoadNodata()
    /* items.add((items.length+1).toString());
    if(mounted)
    setState(() {

    }); */
    refreshController.loadComplete();
  }

  void canvasInit() {
    Rx<UserModel> user = this.user.user;
    List<String> idContacts = user.value.idcontacts;
    List<String> idCanvas = user.value.idcanvas;
    for (ContactModel contact in contactsbd.contacts) {
      for (String id in idContacts) {
        if (contact.id == id) {
          idCanvas.add(contact.idCanvas);
        }
      }
    }
    for (var canvas in canvasbd) {
      for (var id in idCanvas) {
        if (canvas.id == id) {
          this.canvas.addAll(canvas.canvas);
        }
      }
    }
    canvas.shuffle();
  }

  @override
  void onInit() {
    canvasInit();
    super.onInit();
  }

  Map canvasVote(int index) {
    int voteP = 0;
    int voteN = 0;

    for (var vote in canvas[index].vote) {
      if (vote) {
        voteP += 1;
      } else {
        voteN += 1;
      }
    }
    return <String, int>{
      'positive': voteP,
      'negative': voteN,
    };
  }

  String id(int index) {
    return canvas[index].id;
  }

  String idUser(int index) {
    return canvas[index].idUser;
  }

  bool canvasStateDelete(int index) {
    return canvas[index].delete;
  }

  String canvasImage(int index) {
    return canvas[index].image;
  }

  canvasUpdateVote(int index, bool vote) {
    canvas[index].vote.add(vote);
    update();
  }

  canvasDelete(String id) {
    Get.showSnackbar(const GetSnackBar(
      title: 'Bevy',
      message: 'Eliminando canvas',
      duration: Duration(milliseconds: 2500),
    ));

    for (CanvasModel canva in canvas) {
      if (canva.id == id) {
        canva.delete = true;
      }
    }

    update();
  }

  /* canvasOption(int value, {required int index}) {
    if (value == 0) {
      canvasDelete(index);
    }
    if (value == 1) {
      Get.toNamed('/home/mural/canvas/report');
    }
  } */

  addCanvas(BuildContext context) async {
    final AssetEntity? entity = await CameraPicker.pickFromCamera(
      context,
      locale: const Locale('es', 'ES'),
    );
    if (entity != null) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Bevy',
        message: 'Subiendo canvas',
        duration: Duration(milliseconds: 2500),
      ));
      canvas.insert(
          0,
          CanvasModel(
              idUser: user.user.value.id,
              id: uuid.v4(),
              image: 'https://picsum.photos/200',
              vote: [
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
              ],
              delete: false));
      update();
      //subir canvas
    }
  }
}
