// To parse this JSON data, do
//
//     final subjectsDataModel = subjectsDataModelFromJson(jsonString);

import '../../domain/entities/Subjects.dart';
import 'dart:convert';

SubjectsDataModel subjectsDataModelFromJson(String str) => SubjectsDataModel.fromJson(json.decode(str));

String subjectsDataModelToJson(SubjectsDataModel data) => json.encode(data.toJson());




