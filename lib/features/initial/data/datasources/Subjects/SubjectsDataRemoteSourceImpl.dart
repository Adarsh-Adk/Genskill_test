import 'package:genskill_test/core/constants/URL.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/features/initial/data/models/SubjectsDataModel.dart';
import 'package:genskill_test/features/initial/domain/entities/Subjects.dart';
import 'package:http/http.dart'as http;
import 'package:meta/meta.dart';

import 'SubjectsDataRemoteSource.dart';
class SubjectsDataRemoteSourceImpl implements SubjectsDataRemoteDataSource{
  final http.Client client;

  SubjectsDataRemoteSourceImpl({@required this.client});

  @override
  Future<SubjectsDataModel> getSubjects() async{
    print("get students called");
    Uri uri=Uri.parse("${URL.BASEURL}subjects/${URL.APIKEY}");
    final response=await client.get(uri,headers: {'Content-Type': 'application/json'});
    if(response.statusCode==200){
      var result=subjectsDataModelFromJson(response.body);
      print(result);
      return result;
    }else{
      print(response.statusCode);
      throw ServerException;
    }
  }








}

