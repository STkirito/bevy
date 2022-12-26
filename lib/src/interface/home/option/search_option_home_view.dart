import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/home/option/search_option_home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchOptionView extends GetView {
  const SearchOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);

    return GetBuilder(
        init: Get.put(SearchOptionHomeController()),
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
              title: SizedBox(
                height: AwsScreenSize.height(6),
                child: TextField(
                  onChanged: (value) {
                    controller.control.value = false;
                  },
                  onSubmitted: (value) => controller.search(value),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    hintText: 'Buscador'.tr,
                    //fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            body: SizedBox(
              height: AwsScreenSize.height(100),
              width: AwsScreenSize.width(100),
              child: Obx(() {
                return controller.control.value
                    ? Stack(
                        children: [
                          WebViewWidget(controller: controller.controller),
                          if (controller.loadingPercentage < 100) ...[
                            LinearProgressIndicator(
                              value: controller.loadingPercentage / 100.0,
                              color: Colors.red,
                            ),
                          ]
                        ],
                      )
                    : Center(
                        child: Text('Ingrese una busqueda'.tr),
                      );
              }),
            ),
          );
        });
  }
}
