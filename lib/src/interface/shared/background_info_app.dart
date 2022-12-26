import 'dart:ui';
import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class BackGroundInfoApp extends StatelessWidget {
  final Widget _child;
  const BackGroundInfoApp({required Widget child, super.key}) : _child = child;

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return Container(
      height: AwsScreenSize.height(100),
      width: AwsScreenSize.width(100),
      color: const Color.fromRGBO(114, 162, 240, 94),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircularParticle(
            key: UniqueKey(),
            awayRadius: 80,
            numberOfParticles: 400,
            speedOfParticles: 1,
            height: AwsScreenSize.height(100),
            width: AwsScreenSize.width(100),
            onTapAnimation: true,
            particleColor: Colors.black.withAlpha(150),
            awayAnimationDuration: const Duration(milliseconds: 600),
            maxParticleSize: 8,
            isRandSize: true,
            isRandomColor: true,
            randColorList: [
              Colors.red.withAlpha(210),
              Colors.white.withAlpha(210),
              Colors.amber.withAlpha(210),
              Colors.green.withAlpha(210),
              Colors.blue.withAlpha(210),
              Colors.black.withAlpha(210),
            ],
            awayAnimationCurve: Curves.bounceIn,
            //easeInOutCubicEmphasized
            enableHover: true,
            hoverColor: Colors.white,
            hoverRadius: 90,
            connectDots: false, //not recommended
          ),
          SizedBox(
            height: AwsScreenSize.height(20),
            width: AwsScreenSize.width(85),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                child: _child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
