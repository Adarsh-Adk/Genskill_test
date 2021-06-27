import 'package:genskill_test/core/constants/URL.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/features/initial/data/models/ClassRoomDataModel.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:http/http.dart'as http;
import 'ClassRoomRemoteDataSource.dart';
import 'package:meta/meta.dart';

class ClassRoomRemoteDataSourceImpl implements ClassRoomRemoteDataSource{
  final http.Client client;

  ClassRoomRemoteDataSourceImpl({@required this.client});

  @override
  Future<ClassRoomsDataModel> getClassRooms() async{
    print("get classrooms called");
    Uri uri=Uri.parse("${URL.BASEURL}/classrooms/${URL.APIKEY}");
    final response=await client.get(uri,headers: {'Content-Type': 'application/json'});
    if(response.statusCode==200){
      var result=classRoomsDataModelFromJson(response.body);
      print(result);
      return result;
    }else{
      print(response.statusCode);
      throw ServerException;
    }
  }

  @override
  Future<ClassRoomDataModel> getClassRoom(int id) async{
    print("get classrooms called");
    Uri uri=Uri.parse("${URL.BASEURL}/classrooms/$id${URL.APIKEY}");
    final response=await client.get(uri,headers: {'Content-Type': 'application/json'});
    if(response.statusCode==200){
      var result=classRoomDataModelFromJson(response.body);
      print(result);
      return result;
    }else{
      print(response.statusCode);
      throw ServerException;
    }
  }
}

