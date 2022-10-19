import 'package:flutter/material.dart';
import 'package:untitled/src/ui/models/task_model.dart';

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
    return taskList();
  }

  taskList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: RawScrollbar(
        controller: _scrollController,
        trackVisibility: true,
        thumbVisibility: true,
        trackColor: Colors.grey,
        thumbColor: Colors.teal,
        radius: const Radius.circular(10),
        trackRadius: const Radius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
