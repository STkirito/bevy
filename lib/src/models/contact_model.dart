class ContactModel {
  String id;
  String avatar;
  String name;
  String? message;
  String idChat;
  String idCanvas;
  bool status;
  bool delete;

  ContactModel(
      {required this.id,
      required this.avatar,
      required this.name,
      this.message,
      required this.idChat,
      required this.idCanvas,
      required this.status,
      required this.delete});
}
