import 'dart:io';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatMessage extends StatelessWidget {
  final String? message;
  final DateTime date;
  final String id;
  final String idUser;
  String? imageUrl;
  final File? imageLocal;
  final AnimationController animationController;
  void Function()? onTap;
  ChatMessage(
      {Key? key,
      this.message,
      required this.date,
      this.imageUrl,
      required this.id,
      required this.idUser,
      required this.animationController,
      this.onTap,
      this.imageLocal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return AwsAniWidget(
        animation:
            id == idUser ? AwsAnimationDo.flipInX : AwsAnimationDo.flipInX,
        child: id == idUser ? _myMessage() : _notMyMessage());
  }

  Widget _myMessage() {
    if (imageLocal == null || imageUrl == null && message != null) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 5, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Color(0xff4D9EF6),
              borderRadius: BorderRadius.circular(20)),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: AwsScreenSize.width(50)),
                  child: Text(
                    message.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(top: 13),
                width: 30,
                child: Text(
                  AwsFormatter.completTime(
                      hour: date.hour, minute: date.minute),
                  style: TextStyle(
                    color: Colors.white.withOpacity(.6),
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(right: 5, bottom: 5, left: 50),
          decoration: BoxDecoration(
              color: Color(0xff4D9EF6),
              borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            //margin: const EdgeInsets.only(bottom: 5, top: 10),

            width: AwsScreenSize.width(70),
            height: AwsScreenSize.height(50),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: imageLocal != null && imageLocal!.existsSync()
                  ? Image.file(
                      imageLocal!,
                      fit: BoxFit.cover,
                    )
                  : FadeInImage(
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage('assets/temp/jar-loading.gif'),
                      image: NetworkImage(imageUrl!),
                    ),
            ),
          ),
        ),
      );
    }
  }

  Widget _notMyMessage() {
    if (imageUrl == null && message != null) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 5, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: AwsScreenSize.width(50)),
                  child: Text(
                    message.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(top: 13),
                width: 30,
                child: Text(
                  AwsFormatter.completTime(
                      hour: date.hour, minute: date.minute),
                  style: TextStyle(
                    color: Colors.black.withOpacity(.6),
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          //margin: const EdgeInsets.only(bottom: 5, top: 10),
          width: AwsScreenSize.width(70),
          height: AwsScreenSize.height(60),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/temp/jar-loading.gif'),
              image: NetworkImage(imageUrl!),
            ),
          ),
        ),
      );
    }
  }
}
