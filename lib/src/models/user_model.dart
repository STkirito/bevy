class UserModel {
  String id;
  String avatar;
  String name;
  String email;
  String password;
  String idContact;
  List<String> idcontacts;
  List<String> idcanvas;
  String idSettings;
  UserModel(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.email,
      required this.password,
      required this.idContact,
      required this.idcontacts,
      required this.idcanvas,
      required this.idSettings});
}
