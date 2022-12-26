import 'package:bevy/src/models/chat_model.dart';

class ListChatsModel {
  String id;
  List<ChatModel> chats;
  ListChatsModel({required this.id, required this.chats});
}
