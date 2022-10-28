import 'package:untitled/src/models/salary.dart';

import '../models/task.dart';

class Employee {
  final int id;
  final String name;
  final String imageURL;
  late DateTime? startTime;
  late DateTime? endTime;
  late int workArea;

  Employee({
    required this.id,
    required this.name,
    required this.imageURL,
  });
}
