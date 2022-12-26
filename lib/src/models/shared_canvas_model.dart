import 'package:bevy/src/models/canvas_model.dart';

class SharedCanvasModel {
  String id;
  List<CanvasModel> canvas;
  SharedCanvasModel({required this.id, required this.canvas});
}
