import 'package:awesonestyle/services.dart';
import 'package:flutter/material.dart';

class BackgroundChat extends StatelessWidget {
  Widget child;
  BackgroundChat(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return Container(
      width: AwsScreenSize.width(100),
      height: AwsScreenSize.height(100),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/avatar.jpeg'), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
