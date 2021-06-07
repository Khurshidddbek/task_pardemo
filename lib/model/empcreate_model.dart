import 'package:task_pardemo/model/emp_model.dart';

class EmpCreate {
  String status;
  Employee data;

  EmpCreate.fromJson(Map<String, dynamic> json)
    : status = json['status'],
      data = Employee.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data.toJson(),
  };
}