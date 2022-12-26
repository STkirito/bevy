import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/home/home_controller.dart';
import 'package:bevy/src/interface/home/tab/contacts/contact_view.dart';
import 'package:bevy/src/interface/home/tab/mural/mural_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
              title: const Text('Bevy'),
              centerTitle: false,
              automaticallyImplyLeading: false,
              actions: [
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () =>
                      controller.cameraOptionAndNavigationToView(context),
                  child: const Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () => Get.toNamed('/home/option/search'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: PopupMenuButton(
                    color: const Color.fromRGBO(114, 162, 240, 94),
                    position: PopupMenuPosition.under,
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onSelected: (value) => controller.menuOption(value),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 0,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Ajustes'.tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.logout_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Cerrar sesión'.tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ],
              bottom: TabBar(
                controller: tabController,
                indicatorColor: const Color.fromRGBO(114, 162, 240, 94),
                tabs: const [
                  Tab(icon: Icon(Icons.egg_rounded)),
                  Tab(icon: Icon(Icons.wechat)),
                ],
              ),
            ),
            body: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: tabController,
                children: const [
                  MuralView(),
                  ContactView(),
                ]),
          );
        });
  }
}
