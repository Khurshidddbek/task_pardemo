class EmpDelete {
  String status, data, message;

  EmpDelete.fromJson(Map<String, dynamic> json)
    : status = json['status'],
      data = json['data'],
      message = json['message'];

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data,
    'message' : message,
  };
}