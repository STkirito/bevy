import 'dart:io';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:bevy/src/bd/chats.dart';
import 'package:bevy/src/bd/contacts.dart';
import 'package:bevy/src/controllers/home/tab/contacts/contacts_controller.dart';
import 'package:bevy/src/controllers/data/user_controller.dart';
import 'package:bevy/src/models/chat_model.dart';
import 'package:bevy/src/models/list_chats_model.dart';
import 'package:bevy/src/models/message_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class _Define {
  final UserController _controllerUser = Get.find<UserController>();
  TextEditingController message = TextEditingController();
  RxBool emojis = false.obs;
  TextEditingController emoji = TextEditingController();
  var _chat;
}

class ChatContactControlller extends GetxController with _Define {
/*   var _messages; */

  initChat({required String id}) {
    ListChatsModel? inc;
    for (ListChatsModel chat in chats) {
      if (chat.id == _controllerUser.user.value.idContact) {
        inc = chat;
      }
    }

    if (inc != null) {
      for (ChatModel individualchat in inc.chats) {
        if (individualchat.id == id) {
          _chat = Rx<ChatModel>(individualchat);
        }
      }
    }
  }

  Map chat() {
    Rx<ChatModel> ichat = _chat;

    return {
      'id': ichat.value.id,
      'avatar': ichat.value.avatar,
      'name': ichat.value.name,
      'message': ichat.value.message,
      'idUser': _controllerUser.user.value.id,
      'messageLength': ichat.value.message.length,
    };
  }

  inputMessage({String? message}) {
    if (message != null && message.isNotEmpty) {
      Rx<ChatModel> ichat = _chat;
      ichat.value.message.insert(
          0,
          MessageModel(
              id: _controllerUser.user.value.id,
              message: message,
              date: DateTime.now()));
      emojis.value = false;
      this.message.clear();
      update();
    } else if (this.message.text.isNotEmpty) {
      Rx<ChatModel> ichat = _chat;
      ichat.value.message.insert(
          0,
          MessageModel(
              id: _controllerUser.user.value.id,
              message: this.message.text,
              date: DateTime.now()));
      emojis.value = false;
      this.message.clear();
      update();
    } else {
      return null;
    }
  }

  inputMessageImage(File image) {
    Rx<ChatModel> ichat = _chat;
    ichat.value.message.insert(
        0,
        MessageModel(
            id: _controllerUser.user.value.id,
            imageLocal: image.path,
            date: DateTime.now()));
    emojis.value = false;

    update();
  }

  /* inputEmoji() {
    if (emoji.text != '') {
      message.text += emoji.text;
    }
  } */
  inputEmoji(Emoji? emoji) {
    if (emoji != null) {
      message.text += emoji.emoji;
    }
  }
}
