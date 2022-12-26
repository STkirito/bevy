import 'dart:io';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/controllers/home/tab/contacts/chat/chat_contact_controller.dart';
import 'package:bevy/src/interface/shared/background_chat.dart';
import 'package:bevy/src/interface/shared/chat_message.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class ChatContactView extends StatefulWidget {
  ChatContactView({super.key});

  @override
  State<ChatContactView> createState() => _ChatContactViewState();
}

class _ChatContactViewState extends State<ChatContactView> {
  late ChatContactControlller controller;
  AwsArguments _arguments = Get.arguments;

  @override
  void initState() {
    controller = Get.put(ChatContactControlller());
    controller.initChat(id: _arguments.map!['id']);
    super.initState();
  }

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
          onPressed: () => Get.back(),
        ),
        title: _AppBarChat(),
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              color: const Color.fromRGBO(114, 162, 240, 94).withRed(1),
              onSelected: ((value) {
                if (value == 0) {
                  Get.toNamed('/home/contacs/contact/shared', arguments: {
                    'id': controller.chat()['id'],
                    'avatar': controller.chat()['avatar'],
                    'name': controller.chat()['name'],
                  });
                }
              }),
              itemBuilder: (context) {
                return [
                  /* PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Perfil',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ), */
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Compartir',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ];
              }),
          /* CupertinoButton(
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {}), */
        ],
      ),
      body: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        if (isKeyboardVisible) {
          controller.emojis.value = false;
          return SafeArea(
            child: BackgroundChat(
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _wPost(),
              ),
            ),
          );
        } else if (controller.emojis.value) {
          return SafeArea(
            child: BackgroundChat(
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _wPost(),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: BackgroundChat(
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _wPost(),
              ),
            ),
          );
        }
      }),
    );
  }

  Column _wPost() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Posts(),
        _Input(),
      ],
    );
  }
}

class _AppBarChat extends GetView<ChatContactControlller> {
  const _AppBarChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(controller.chat()['avatar']),
        ),
        SizedBox(width: 5),
        Text(controller.chat()['name']),
      ],
    );
  }
}

class _Posts extends StatefulWidget {
  const _Posts();

  @override
  State<_Posts> createState() => _PostsState();
}

class _PostsState extends State<_Posts> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatContactControlller>(builder: (controller) {
      return Obx(
        () => ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: AwsScreenSize.width(100),
            height: controller.emojis.value
                ? AwsScreenSize.height(50)
                : AwsScreenSize.height(79),
          ),
          //color: Colors.red,
          child: ListView.builder(
              controller: ScrollController(),
              dragStartBehavior: DragStartBehavior.down,
              shrinkWrap: true,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              //padding: EdgeInsets.only(top: 10),
              itemCount: controller.chat()['messageLength'],

              //itemExtent: 5,
              itemBuilder: (context, index) {
                return ChatMessage(
                  id: controller.chat()['message'][index].id,
                  idUser: controller.chat()['idUser'],
                  message: controller.chat()['message'][index].message,
                  date: controller.chat()['message'][index].date,
                  animationController: AnimationController(vsync: this),
                  imageUrl: controller.chat()['message'][index].imageUrl,
                  imageLocal: controller.chat()['message'][index].imageLocal ==
                          null
                      ? null
                      : File(controller.chat()['message'][index].imageLocal),
                );
              }),
        ),
      );
    });
  }
}

class _Input extends GetView<ChatContactControlller> {
  _Input();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flex(
        direction: Axis.vertical,
        children: [
          Container(
            width: AwsScreenSize.width(100),
            height: AwsScreenSize.height(7),
            margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  width: AwsScreenSize.width(73),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(114, 162, 240, 94),
                  ),
                  child: TextField(
                    controller: controller.message,
                    //onEditingComplete: () => controller.inputMessage,
                    style: TextStyle(color: Colors.white),
                    onSubmitted: (value) =>
                        controller.inputMessage(message: value),
                    onTap: () => controller.emojis.value = false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Mensaje'.tr,
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                      prefixIcon: CupertinoButton(
                        child: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          controller.emojis.value = !controller.emojis.value;
                        },
                      ),
                      suffixIcon: CupertinoButton(
                        child: const Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          final AssetEntity? entity =
                              await CameraPicker.pickFromCamera(
                            context,
                            locale: Locale('es', 'ES'),
                          );
                          File? image = await entity?.file;
                          if (image != null) {
                            controller.inputMessageImage(image);
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(114, 162, 240, 94),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(114, 162, 240, 94),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: const Color.fromRGBO(114, 162, 240, 94),
                  child: const Icon(Icons.send),
                  onPressed: controller.inputMessage,
                ),
              ],
            ),
          ),
          _emoji(controller.emojis.value),
        ],
      ),
    );
  }

  Container _emoji(bool state) {
    print('emoji state: $state');
    if (state) {
      return Container(
        width: AwsScreenSize.width(100),
        height: AwsScreenSize.height(30),
        alignment: Alignment.bottomCenter,
        child: EmojiPicker(
          //textEditingController: controller.emoji,
          onEmojiSelected: (category, emoji) {
            controller.inputEmoji(emoji);
            print('selected: $emoji');
          },
          /* onEmojiSelected: (Category category, Emoji emoji) {
                // Do something when emoji is tapped (optional)
            }, */
          onBackspacePressed: () {
            // Do something when the user taps the backspace button (optional)
          },
          //textEditingController: textEditionController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
          config: Config(
            columns: 7,
            emojiSizeMax: 32 *
                (defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.30
                    : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            //initCategory: Category.RECENT,
            bgColor: Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            backspaceColor: Colors.blue,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            showRecentsTab: true,
            recentsLimit: 28,
            noRecents: const Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
              textAlign: TextAlign.center,
            ), // Needs to be const Widget
            loadingIndicator:
                const SizedBox.shrink(), // Needs to be const Widget
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
