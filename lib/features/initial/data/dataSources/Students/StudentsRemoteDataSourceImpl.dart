import 'dart:convert';
import '../../../../../core/constants/URL.dart';
import '../../../../../core/error/Exception.dart';
import '../../datasources/Students/StudentsRemoteDataSource.dart';
import '../../models/StudentsDataModel.dart';
import '../../../domain/entities/Students.dart';
import 'package:http/http.dart'as http;
class StudentsRemoteDataSourceImpl implements StudentsRemoteDataSource{
  final http.Client client;

  StudentsRemoteDataSourceImpl({required this.client});

  @override
  Future<StudentsDataModel> getStudents() async{
    print("get students called");
    Uri uri=Uri.parse("${URL.BASEURL}/students/${URL.APIKEY}");
    final response=await client.get(uri,headers: {'Content-Type': 'application/json'});
    if(response.statusCode==200){
      var result=studentsDataModelFromJson(response.body);
      print(result);
      return result;
    }else{
      print(response.statusCode);
      throw ServerException;
    }
  }

  @override
  Future<Student> getStudent(int id) async{
    print("get students called");
    Uri uri=Uri.parse("${URL.BASEURL}/students/$id${URL.APIKEY}");
    final response=await client.get(uri,headers: {'Content-Type': 'application/json'});
    if(response.statusCode==200){
      var result=Student.fromJson(json.decode(response.body));
      print(result);
      return result;
    }else{
      print(response.statusCode);
      throw ServerException;
    }
  }




}

