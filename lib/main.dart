import 'package:flutter/material.dart';
import 'package:untitled/src/models/employee.dart';
import 'package:untitled/src/models/salary.dart';
import 'package:untitled/src/models/task.dart';
import 'package:untitled/src/components/work_calendar_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          return WorkCalendarComponent(
            employee: Employee(
              salary: Salary(dailySalary: 44310, totalSalary: 1041242),
              tasks: [
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
                Task(procedure: "A", product: "Asf", amount: 10),
              ],
              id: 10,
              imageURL: "https://pbs.twimg.com/media/Bz20cVEIYAAGS-4.jpg",
              name: 'Patricia Martínez',
            ),
          );
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
