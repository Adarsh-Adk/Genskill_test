class StudentsDataModel {
  StudentsDataModel({
    required this.students,
  });

  List<Student> students;

  factory StudentsDataModel.fromJson(Map<String, dynamic> json) => StudentsDataModel(
    students: List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "students": List<dynamic>.from(students.map((x) => x.toJson())),
  };
}

class Student {
  Student({
    required this.age,
    required this.email,
    required this.id,
    required this.name,
  });

  int? age;
  String? email;
  int? id;
  String? name;
  factory Student.fromJson(Map<String, dynamic> json) => Student(
    age: json["age"],
    email: json["email"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "email": email,
    "id": id,
    "name": name,
  };

}