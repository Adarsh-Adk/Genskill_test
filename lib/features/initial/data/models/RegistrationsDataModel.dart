import '../../domain/entities/Registrations.dart';
import 'dart:convert';

RegistrationsDataModel registrationsDataModelFromJson(String str) => RegistrationsDataModel.fromJson(json.decode(str));

String registrationsDataModelToJson(RegistrationsDataModel data) => json.encode(data.toJson());


RegistrationDataModel registrationDataModelFromJson(String str) => RegistrationDataModel.fromJson(json.decode(str));

String registrationDataModelToJson(RegistrationDataModel data) => json.encode(data.toJson());