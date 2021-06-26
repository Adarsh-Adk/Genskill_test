import 'package:genskill_test/core/constants/URL.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/features/initial/data/datasources/Students/StudentsDataRemoteSource.dart';
import 'package:genskill_test/features/initial/data/models/StudentsDataModel.dart';
import 'package:genskill_test/features/initial/domain/entities/Students.dart';
import 'package:http/http.dart'as http;
import 'package:meta/meta.dart';
class StudentsDataRemoteSourceImpl implements StudentsDataRemoteDataSource{
  final http.Client client;

  StudentsDataRemoteSourceImpl({@required this.client});

  @override
  Future<StudentsDataModel> getStudents() async{
    print("get students called");
    Uri uri=Uri.parse("${URL.BASEURL}students/${URL.APIKEY}");
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




}

