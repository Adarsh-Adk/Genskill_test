// To parse this JSON data, do
//
//     final studentsDataModel = studentsDataModelFromJson(jsonString);

import 'package:genskill_test/features/initial/domain/entities/Students.dart';
import 'dart:convert';

StudentsDataModel studentsDataModelFromJson(String str) => StudentsDataModel.fromJson(json.decode(str));

String studentsDataModelToJson(StudentsDataModel data) => json.encode(data.toJson());