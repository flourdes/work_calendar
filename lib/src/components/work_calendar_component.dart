import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/src/models/employee.dart';

class WorkCalendarComponent extends StatefulWidget {
  final Employee employee;

  const WorkCalendarComponent({
    Key? key,
    required this.employee,
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
          const Divider(
            height: 0,
            endIndent: 25,
          ),
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
                padding: const EdgeInsets.only(right: 25),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: widget.employee.tasks.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.employee.tasks[index].product,
                                style: const TextStyle(
                                  color: Colors.teal,
                                ),
                              ),
                              Text(widget.employee.tasks[index].procedure),
                              Text(widget.employee.tasks[index].amount
                                  .toString()),
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
    List<String> lista = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"];

    return Padding(
      padding: const EdgeInsets.all(0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 600,
              width: 1000,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox.square(
                          dimension: 35,
                          child: Image.network(
                            widget.employee.imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        widget.employee.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: Colors.grey.shade300,
                    thickness: 2,
                    indent: 30,
                    endIndent: 20,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: TableCalendar(
                                firstDay: DateTime.utc(2010, 10, 16),
                                lastDay: DateTime.utc(2030, 3, 14),
                                focusedDay: DateTime.now(),
                                headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                ),
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                daysOfWeekStyle: DaysOfWeekStyle(
                                  dowTextFormatter: (date, locale) {
                                    return lista[date.weekday - 1];
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
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
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 5),
                child: SizedBox.square(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profits() {
    late double ganancia = widget.employee.salary.dailySalary;
    late double ganancias = widget.employee.salary.totalSalary;
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _profitsContainer('Ganancia Diaria:', ganancia),
          const SizedBox(height: 10),
          _profitsContainer('Ganancia Total:', ganancias),
        ],
      ),
    );
  }

  Widget _profitsContainer(String label, double ganancia) {
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
