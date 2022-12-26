import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:custom_qr_generator/custom_qr_generator.dart';
import 'package:flutter/material.dart';

class MyQrOptionContactView extends GetView {
  const MyQrOptionContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(
          init: Get.find<UserController>(),
          builder: (controller) {
            return Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                            NetworkImage(controller.user.value.avatar),
                        maxRadius: 80,
                      ),
                    ),
                    Text(
                      controller.user.value.name,
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
                Container(
                  height: AwsScreenSize.height(45),
                  width: AwsScreenSize.width(100),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: CustomPaint(
                      painter: QrPainter(
                          data: 'Bevy/id/${controller.user.value.id}}',
                          options: QrOptions(
                              shapes: const QrShapes(
                                  darkPixel: QrPixelShapeRoundCorners(
                                      cornerFraction: .5),
                                  frame: QrFrameShapeRoundCorners(
                                      cornerFraction: .25),
                                  ball: QrBallShapeRoundCorners(
                                      cornerFraction: .25)),
                              colors: QrColors(
                                  dark: QrColorLinearGradient(
                                      colors: [
                                    Color.fromRGBO(114, 162, 240, 94),
                                    Color.fromRGBO(114, 162, 240, 94)
                                        .withRed(1),
                                  ],
                                      orientation:
                                          GradientOrientation.leftDiagonal)))),
                      size: const Size(350, 350),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
