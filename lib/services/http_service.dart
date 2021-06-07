import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_pardemo/model/emp_model.dart';
import 'package:task_pardemo/model/empdelete_model.dart';
import 'package:task_pardemo/model/emplist_model.dart';
import 'package:task_pardemo/model/empone_model.dart';
import 'package:task_pardemo/model/user_model.dart';

class Network {
  static String BASE = 'dummy.restapiexample.com';

  /* HTTP APIs */
  // ***************************************************************************
  static String API_LIST = '/api/v1/employees';
  static String API_EMP = '/api/v1/employee/';  // {Id}
  static String API_CREATE = '/api/v1/create';
  static String API_UPDATE = '/api/v1/update/';  // {Id}
  static String API_DELETE = '/api/v1/delete/';  // {Id}
  // ***************************************************************************


  /* HTTP Request */
  // ***************************************************************************
  static Future<String> GET(String api, Map<String, String> params) async{
    var uri = Uri.https(BASE, api, params);
    var respose = await get(uri);
    if(respose.statusCode == 200) return respose.body;
    print('Get Method Error : ${respose.statusCode}');
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, body: params);
    if(response.statusCode == 200) return response.body;
    print('POST Method Error : ${response.statusCode}');
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, body: params);
    if (response.statusCode == 200) return response.body;
    print('PUT Method Error : ${response.statusCode}');
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await delete(uri, body: params);
    if(response.statusCode == 200) return response.body;
    print('DELETE Method Error : ${response.statusCode}');
    return null;
  }
  // ***************************************************************************


  /* HTTP Params */
  // ***************************************************************************
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(User user) {
    Map<String, String> params = Map();
    params.addAll({
      'name' : user.name,
      'salary' : user.salary,
      'age' : user.age,
    });
  }

  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> params = Map();
    params.addAll({
      'id' : user.id.toString(),
      'name' : user.name,
      'salary' : user.salary,
      'age' : user.age,
    });
  }
  // ***************************************************************************


  /* HTTP Parsing */
  // ***************************************************************************
  static EmpList parseEmpList(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmpOne parseEmpCreate(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmpDelete parseEmpDelete(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpDelete.fromJson(json);
    return data;
  }
}