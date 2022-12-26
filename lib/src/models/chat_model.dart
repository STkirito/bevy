import 'package:bevy/src/models/message_model.dart';

class ChatModel {
  String id;
  String avatar;
  String name;
  List<MessageModel> message;
  ChatModel(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.message});
}
