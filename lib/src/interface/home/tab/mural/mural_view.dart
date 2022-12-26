import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/home/tab/mural/mural_home_controller.dart';
import 'package:bevy/src/interface/shared/canvas.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MuralView extends GetView {
  const MuralView({super.key});
  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return GetBuilder(
        init: Get.put(MuralHomeController()),
        builder: (controller) {
          return Scaffold(
            //backgroundColor: Colors.white,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
                child: const Icon(FontAwesomeIcons.circlePlus),
                onPressed: () => controller.addCanvas(context)),
            body: const MuralListItem(),
          );
        });
  }
}

class MuralListItem extends GetView {
  const MuralListItem({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return GetBuilder<MuralHomeController>(builder: (controller) {
      return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropHeader(),
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.canvas.length,
            itemBuilder: (context, index) {
              if (!controller.canvas[index].delete) {
                return Canvas(
                  image: controller.canvasImage(index),
                  votePlus: controller.canvasVote(index)['positive'],
                  onTapVotePlus: () => controller.canvasUpdateVote(index, true),
                  voteNegative: controller.canvasVote(index)['negative'],
                  onTapVoteNegative: () =>
                      controller.canvasUpdateVote(index, false),
                  delete: controller.idUser(index) ==
                              controller.user.user.value.id &&
                          controller.canvasStateDelete(index) == false
                      ? true
                      : false,
                  onDelete: () => controller.canvasDelete(controller.id(index)),
                );
              } else {
                return Container();
              }
            }),
      );
    });
  }
}
