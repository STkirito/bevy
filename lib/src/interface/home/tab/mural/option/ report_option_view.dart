// ignore_for_file: file_names

import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportMuralOptionView extends StatelessWidget {
  const ReportMuralOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
        leading: CupertinoButton(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => Get.back()),
        title: Text('Reportar'),
      ),
      body: Container(
        child: Center(
          child: Text('Report Option View'),
        ),
      ),
    );
  }
}
