import 'package:flutter/material.dart';
import 'package:untitled/src/work_calendar_component.dart';
import 'package:untitled/src/models/task_model.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
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

}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _save() {
    showDialog(
        context: context,
        builder: (context) {
          return WorkCalendarComponent(task);
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
            onPressed: _save,
            padding: const EdgeInsets.all(12),
            color: Colors.blueAccent,
            child: Text("trabajos"),
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    ;
  }
}
