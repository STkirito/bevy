import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/auth/loading_auth_controller.dart';
import 'package:flutter/material.dart';

class LoadingAuthView extends GetView {
  const LoadingAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return GetBuilder<LoadingAuthController>(
        init: Get.put(LoadingAuthController()),
        builder: ((controller) {
          return Scaffold(
            body: FutureBuilder<bool>(
                future: controller.checkToken(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == true) {
                      Future.microtask(() => controller.navigationToHome());
                    } else {
                      Future.microtask(() => controller.navigationToLogin());
                    }
                  }
                  return Container(
                    height: AwsScreenSize.height(100),
                    width: AwsScreenSize.width(100),
                    color: const Color.fromRGBO(114, 162, 240, 94),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/cargando.gif'),
                          const Text(
                            'Bevy',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
          );
        }));
  }
}
