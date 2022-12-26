import 'package:awesonestyle/awesonestyle.dart';
import 'package:custom_qr_generator/custom_qr_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareOptionContactChatView extends GetView {
  final Map _arguments = Get.arguments;
  ShareOptionContactChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
        leading: CupertinoButton(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => Get.back()),
        title: Text('Compartir'.tr),
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                //color: Colors.blue,
                padding: const EdgeInsets.only(bottom: 30),
                height: AwsScreenSize.height(30),
                width: AwsScreenSize.width(100),
                child: CircleAvatar(
                  backgroundImage: AssetImage(_arguments['avatar']),
                  maxRadius: 80,
                ),
              ),
              Text(
                _arguments['name'],
                style: TextStyle(fontSize: 35),
              ),
            ],
          ),
          Container(
            height: AwsScreenSize.height(50),
            width: AwsScreenSize.width(100),
            padding: EdgeInsets.all(20),
            child: CustomPaint(
              painter: QrPainter(
                  data: 'Bevy/${_arguments['name']}/id/${_arguments['id']}',
                  options: QrOptions(
                      shapes: QrShapes(
                          darkPixel:
                              QrPixelShapeRoundCorners(cornerFraction: .5),
                          frame: QrFrameShapeRoundCorners(cornerFraction: .25),
                          ball: QrBallShapeRoundCorners(cornerFraction: .25)),
                      colors: QrColors(
                          dark: QrColorLinearGradient(colors: [
                        Color.fromRGBO(114, 162, 240, 94),
                        Color.fromRGBO(114, 162, 240, 94).withRed(1),
                        /* Color.fromARGB(255, 255, 0, 0),
                        Color.fromARGB(255, 0, 0, 255), */
                      ], orientation: GradientOrientation.leftDiagonal)))),
              size: const Size(350, 350),
            ),
          ),
        ],
      ),
    );
  }
}
