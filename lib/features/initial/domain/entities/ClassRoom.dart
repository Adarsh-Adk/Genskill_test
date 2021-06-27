import 'package:meta/meta.dart';
class ClassRoomsDataModel {
  ClassRoomsDataModel({
    @required this.classrooms,
  });

  List<Classrooms> classrooms;

  factory ClassRoomsDataModel.fromJson(Map<String, dynamic> json) => ClassRoomsDataModel(
    classrooms: List<Classrooms>.from(json["classrooms"].map((x) => Classrooms.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
  };
}

class Classrooms {
  Classrooms({
    @required this.id,
    @required this.layout,
    @required this.name,
    @required this.size,
  });

  int id;
  String layout;
  String name;
  int size;

  factory Classrooms.fromJson(Map<String, dynamic> json) => Classrooms(
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

class ClassRoomDataModel {
  ClassRoomDataModel({
    @required this.id,
    @required this.layout,
    @required this.name,
    @required this.size,
    @required this.subject,
  });

  int id;
  String layout;
  String name;
  int size;
  String subject;

  factory ClassRoomDataModel.fromJson(Map<String, dynamic> json) => ClassRoomDataModel(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
    "subject": subject,
  };
}