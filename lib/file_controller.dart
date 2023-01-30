import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json/file_manager.dart';
import 'package:json/employee_model.dart';

import 'dart:developer' as dev;

class FileController extends ChangeNotifier {
  List<dynamic>? _employees;

  List<dynamic>? get employee => _employees;

  readEmployees() async {
    var response = await FileManger().readJsonFile();

    dev.log(response.toString());
    _employees =
        AllEmployees.fromJsonAll(await FileManger().readJsonFile()).all;
  }

  writeEmployees(List<Employee> list) async {
    _employees = await FileManger().writeJsonFile(list);
  }
}
