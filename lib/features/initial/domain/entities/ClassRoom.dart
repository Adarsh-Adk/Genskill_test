import 'package:meta/meta.dart';
class ClassRoomDataModel {
  ClassRoomDataModel({
    @required this.classrooms,
  });

  List<Classroom> classrooms;

  factory ClassRoomDataModel.fromJson(Map<String, dynamic> json) => ClassRoomDataModel(
    classrooms: List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
  };
}

class Classroom {
  Classroom({
    @required this.id,
    @required this.layout,
    @required this.name,
    @required this.size,
  });

  int id;
  String layout;
  String name;
  int size;

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
  };
}