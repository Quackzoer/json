import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

import 'dart:developer' as dev;

import 'package:json/employee_model.dart';

class FileManger {
  static FileManger? _instance;

  FileManger._internal() {
    _instance = this;
  }
  factory FileManger() => _instance ?? FileManger._internal();
  Future<String> get _dirPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _file async {
    final path = await _dirPath;
    Directory('$path/employeeData').createSync();
    return File('$path/employeeData/data.json');
  }

  readJsonFile() async {
    List<Map<String, dynamic>> dataContent = [
      {'noData': true}
    ];
    File file = await _file;
    dev.log("Read file: $file");
    dev.log('${file.exists()}');
    dev.log('${file.readAsStringSync()}');
    if (await file.exists()) {
      try {
        dataContent = json.decode(file.readAsStringSync());
      } catch (err) {
        print(err);
      }
    }
    dev.log("Data Content");
    dev.log(dataContent.toString());
    return dataContent;
  }

// Future<List<Employee>>
  writeJsonFile(List<Employee> employeesList) async {
    // final employees =
    //     employeesList.map((employee) => jsonEncode(employee)).toList();
    File file = await _file;
    dev.log("Write file: $file");
    file.writeAsStringSync(json.encode(employeesList));
    dev.log("Encoded List:");
    dev.log(json.encode(employeesList));
    return employeesList;
  }
}
