import 'package:flutter/material.dart';
import 'package:untitled/src/ui/components/work_calendar_component.dart';
import 'package:untitled/src/ui/models/task_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppBar appbar = AppBar(
    title: const Text("Work Calendar"),
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 46, 46, 46),
  );
  List<Task> tasks = [
    Task(
      procedure: "Testfsafdakf",
      product: "Testfadg",
      amount: 10412,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
    Task(
      procedure: "Test",
      product: "Test",
      amount: 10,
    ),
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: appbar,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: WorkCalendarComponent(tasks: tasks),
        ),
      ),
    );
  }
}
