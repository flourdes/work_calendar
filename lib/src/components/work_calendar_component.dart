import 'package:flutter/material.dart';
import 'package:untitled/src/test_calendar.dart';

import 'models/task.dart';

class WorkCalendarComponent extends StatefulWidget {
  final List<Task> tasks;

  const WorkCalendarComponent({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  State<WorkCalendarComponent> createState() => _WorkCalendarComponentState();
}

class _WorkCalendarComponentState extends State<WorkCalendarComponent> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return _workCalendar();
  }

  _taskList() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tareas Realizadas",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          const Divider(height: 0),
          Expanded(
            child: RawScrollbar(
              controller: _scrollController,
              trackVisibility: true,
              thumbVisibility: true,
              trackColor: Colors.grey,
              thumbColor: Colors.teal,
              radius: const Radius.circular(10),
              trackRadius: const Radius.circular(10),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: widget.tasks.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.tasks[index].product,
                                style: const TextStyle(
                                  color: Colors.teal,
                                ),
                              ),
                              Text(widget.tasks[index].procedure),
                              Text(widget.tasks[index].amount.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _workCalendar() {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: (_worckCalendarCard()),
    );
  }

  _worckCalendarCard() {
    return Padding(
      padding: const EdgeInsets.all(0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 600,
          width: 1000,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Juliana Estefanía Martínez",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                color: Colors.grey,
                thickness: 3,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: TestCalendar()),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _profits(),
                          ),
                          // const SizedBox(height: 20),
                          Expanded(
                            flex: 3,
                            child: _taskList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profits() {
    late int ganancia = 420;
    late double ganancias = 10000;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _profitsContainer('Ganancia Diaria:', ganancia),
          const SizedBox(height: 10),
          _profitsContainer('Ganancia Total:', ganancias),
        ],
      ),
    );
  }

  Widget _profitsContainer(String label, ganancia) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              )),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.attach_money,
            size: 20,
            color: Colors.teal,
          ),
          Text(
            ganancia.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
