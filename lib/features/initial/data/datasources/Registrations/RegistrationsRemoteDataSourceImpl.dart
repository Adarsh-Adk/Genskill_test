import 'package:genskill_test/core/constants/URL.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/features/initial/data/models/RegistrationsDataModel.dart';
import 'package:genskill_test/features/initial/domain/entities/Registrations.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'RegistrationsRemoteDataSource.dart';
class RegistrationsRemoteDataSourceImpl implements RegistrationsRemoteDataSource{
  final http.Client client;

  RegistrationsRemoteDataSourceImpl({@required this.client});

  @override
  Future<RegistrationsDataModel> getRegistrations() async{
    print("get registrations called");
    Uri uri=Uri.parse("${URL.BASEURL}/registration/${URL.APIKEY}");
    final response=await client.get(uri,headers: {'Content-Type': 'application/json'});
    if(response.statusCode==200){
      var result=registrationsDataModelFromJson(response.body);
      print(result);
      return result;
    }else{
      print(response.statusCode);
      throw ServerException;
    }
  }

  @override
  Future <int>setRegistration(int subjectId, int studentId) async{
    print("set registration called");
    Uri uri=Uri.parse("${URL.BASEURL}/registration/${URL.APIKEY}");
    final response=await client.post(uri,body: "student=$studentId&subject=$subjectId",headers: {'Content-Type': 'application/x-www-form-urlencoded'});
    if(response.statusCode==200){
      var result=response.statusCode;
      print(result);
      return result;
    }else if(response.statusCode==409){
      var result=response.statusCode;
      return result;
    }else{
      print(response.statusCode);
      throw ServerException;
    }
  }

  @override
  Future<int> deleteRegistration(int registrationId)async {
    print("delete registration called");
    Uri uri=Uri.parse("${URL.BASEURL}/registration/$registrationId${URL.APIKEY}");
    final response=await client.delete(uri,headers: {'Content-Type': 'application/x-www-form-urlencoded'});
    if(response.statusCode==200){
      int result=200;
      print(result);
      return result;
    } else{
      print(response.statusCode);
      throw ServerException;
    }
  }




}