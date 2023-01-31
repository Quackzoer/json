import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json/file_manager.dart';
import 'package:json/employee_model.dart';

import 'dart:developer' as dev;

class FileController extends ChangeNotifier {
  List<dynamic>? _employees;

  List<dynamic>? get employee => _employees;

  readEmployees() async {
    var response = await FileManager().readJsonFile();

    dev.log(response.toString());
    _employees =
        AllEmployees.fromJsonAll(await FileManager().readJsonFile()).all;
  }

  writeEmployees(List<Employee> list) async {
    _employees = await FileManager().writeJsonFile(list);
  }
}
