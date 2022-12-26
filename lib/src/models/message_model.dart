class MessageModel {
  String? name;
  String id;
  String? message;
  String? imageUrl;
  String? imageLocal;
  DateTime date;
  MessageModel(
      {this.name,
      required this.id,
      this.message,
      this.imageUrl,
      this.imageLocal,
      required this.date});
}
