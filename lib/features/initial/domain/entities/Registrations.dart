import 'package:meta/meta.dart';

class RegistrationsDataModel {
  RegistrationsDataModel({
    @required this.registrations,
  });

  List<Registration> registrations;

  factory RegistrationsDataModel.fromJson(Map<String, dynamic> json) => RegistrationsDataModel(
    registrations: List<Registration>.from(json["registrations"].map((x) => Registration.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "registrations": List<dynamic>.from(registrations.map((x) => x.toJson())),
  };
}

class Registration {
  Registration({
    @required this.id,
    @required this.student,
    @required this.subject,
  });

  int id;
  String student;
  String subject;

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
    id: json["id"],
    student: json["student"].toString(),
    subject: json["subject"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student": student,
    "subject": subject,
  };
}
class RegistrationDataModel {
  RegistrationDataModel({
    @required this.registration,
  });

  Registration registration;

  factory RegistrationDataModel.fromJson(Map<String, dynamic> json) => RegistrationDataModel(
    registration: Registration.fromJson(json["registration"]),
  );

  Map<String, dynamic> toJson() => {
    "registration": registration.toJson(),
  };
}
