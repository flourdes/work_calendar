import 'package:untitled/src/models/salary.dart';

import '../models/task.dart';

class Employee {
  final int id;
  final String name;
  final String imageURL;
  late DateTime? startTime;
  late DateTime? endTime;
  late int workArea;
  final List<Task> tasks;
  final Salary salary;

  Employee({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.tasks,
    required this.salary,
  });
}
