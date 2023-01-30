import 'dart:convert';
import 'dart:developer' as dev;

class Employee {
  final String name;
  final String tel;
  final String status;
  final String position;
  final String qualifications;

  static List<Employee>? all = [];
  Employee(
    this.name,
    this.tel,
    this.status,
    this.position,
    this.qualifications,
  ) {
    dev.log('json.toString()');
    Employee.all?.add(this);
  }

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        tel = json['tel'],
        status = json['status'],
        position = json['position'],
        qualifications = json['qualifications'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'tel': tel,
        'status': status,
        'position': position,
        'qualifications': qualifications
      };
}

class AllEmployees {
  List<Employee>? all;

  AllEmployees.fromJsonAll(jsonList) {
    dev.log("jsonList.toString()");
    dev.log(jsonList.toString());
    // all = jsonList.map((e) => Employee.fromJson(e)).toList();
    all = jsonDecode(jsonList);
  }
}
