import 'package:meta/meta.dart';
class SubjectsDataModel {
  SubjectsDataModel({
    @required this.subjects,
  });

  List<Subject> subjects;

  factory SubjectsDataModel.fromJson(Map<String, dynamic> json) => SubjectsDataModel(
    subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
  };
}
class Subject {
  Subject({
    @required this.credits,
    @required this.id,
    @required this.name,
    @required this.teacher,
  });

  int credits;
  int id;
  String name;
  String teacher;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    credits: json["credits"],
    id: json["id"],
    name: json["name"],
    teacher: json["teacher"],
  );

  Map<String, dynamic> toJson() => {
    "credits": credits,
    "id": id,
    "name": name,
    "teacher": teacher,
  };
}