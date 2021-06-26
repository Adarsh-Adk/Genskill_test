// To parse this JSON data, do
//
//     final subjectsDataModel = subjectsDataModelFromJson(jsonString);

import 'package:genskill_test/features/initial/domain/entities/Subjects.dart';
import 'dart:convert';

SubjectsDataModel subjectsDataModelFromJson(String str) => SubjectsDataModel.fromJson(json.decode(str));

String subjectsDataModelToJson(SubjectsDataModel data) => json.encode(data.toJson());




