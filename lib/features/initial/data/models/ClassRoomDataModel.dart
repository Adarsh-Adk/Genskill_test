import '../../domain/entities/ClassRoom.dart';
import 'dart:convert';

ClassRoomsDataModel classRoomsDataModelFromJson(String str) => ClassRoomsDataModel.fromJson(json.decode(str));

String classRoomsDataModelToJson(ClassRoomsDataModel data) => json.encode(data.toJson());

ClassRoomDataModel classRoomDataModelFromJson(String str) => ClassRoomDataModel.fromJson(json.decode(str));

String classRoomDataModelToJson(ClassRoomDataModel data) => json.encode(data.toJson());





