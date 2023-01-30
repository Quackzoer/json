import 'package:flutter/material.dart';
import 'package:json/employee_model.dart';
import 'dart:developer' as dev;

import 'package:json/file_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  dynamic _createEmployee() {
    var testEmp = List.generate(
      10,
      (i) => Employee("name$i", "tel$i", "status$i", "position$i",
          "qualifications$i.1;qualifications$i.2;qualifications$i.3;"),
    );
    dev.log(testEmp[4].qualifications.toString());
    FileController().writeEmployees([testEmp[0], testEmp[9]]);
    return testEmp;
  }

  void readFile() async {
    var res = FileController().readEmployees();
    dev.log('$res');
  }

  @override
  Widget build(BuildContext context) {
    // _createEmployee();
    readFile();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times1:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
