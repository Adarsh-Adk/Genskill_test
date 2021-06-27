// To parse this JSON data, do
//
//     final classRoomDataModel = classRoomDataModelFromJson(jsonString);

import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ClassRoomDataModel classRoomDataModelFromJson(String str) => ClassRoomDataModel.fromJson(json.decode(str));

String classRoomDataModelToJson(ClassRoomDataModel data) => json.encode(data.toJson());


