import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/interface/home/tab/contacts/qr/option/my_qr_option_contact_view.dart';
import 'package:bevy/src/interface/home/tab/contacts/qr/option/scan_qr_option_contact_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyQrAddContactOptionContactView extends StatefulWidget {
  const MyQrAddContactOptionContactView({super.key});

  @override
  State<MyQrAddContactOptionContactView> createState() =>
      _MyQrAddContactOptionContactViewState();
}

class _MyQrAddContactOptionContactViewState
    extends State<MyQrAddContactOptionContactView>
    with TickerProviderStateMixin {
  //UserController controller = Get.find<UserController>();
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(initialIndex: 1, length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
        leading: CupertinoButton(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => Get.back()),
        title: Text('Compartir'.tr),
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
            icon: Icon(Icons.qr_code),
          ),
          Tab(
            icon: Icon(Icons.qr_code_scanner),
          ),
        ]),
      ),
      body: TabBarView(
          controller: tabController,
          physics: BouncingScrollPhysics(),
          children: [
            MyQrOptionContactView(),
            ScanQrOptionContactView(),
          ]),
    );
  }
}
