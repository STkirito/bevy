class CanvasModel {
  String idUser;
  String id;
  String image;
  List<bool> vote;
  bool delete;

  CanvasModel(
      {required this.idUser,
      required this.id,
      required this.image,
      required this.vote,
      required this.delete});
}
