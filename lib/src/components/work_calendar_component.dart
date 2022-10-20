import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/src/models/employee.dart';
import 'package:intl/intl_browser.dart';



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
  late final Color _primaryColor = Colors.grey.shade200;
  late final Color _secondColor = Colors.teal;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return _workCalendar();
  }

  _workCalendar() {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: (_worckCalendarCard()),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  _worckCalendarCard() {
    return SizedBox(
      height: 600,
      width: 1000,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              children: [
                _topPart(),
                Divider(
                  height: 40,
                  color: Colors.grey.shade300,
                  thickness: 2,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: _leftHalf(),
                      ),
                      Expanded(
                        child: _rightHalf(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
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
        ],
      ),
    );
  }

  _topPart() {
    return Row(
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
    );
  }

  _rightHalf() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 15),
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
    );
  }

  _leftHalf() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: _calendar(),
      ),
    );
  }

  _calendar() {
    List<String> days = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"];

    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronIcon: Icon(Icons.chevron_left, size: 50,),
        rightChevronIcon: Icon(Icons.chevron_right, size: 50),

      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) {
          return days[date.weekday - 1];
        },
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  _profits() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _profitsContainer(
            'Ganancia Diaria:', widget.employee.salary.dailySalary),
        const SizedBox(height: 10),
        _profitsContainer(
            'Ganancia Total:', widget.employee.salary.totalSalary),
      ],
    );
  }

  _profitsContainer(String label, double ganancia) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _primaryColor,
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
           Icon(
            Icons.attach_money,
            size: 20,
            color: _secondColor,
          ),
          Text(
            ganancia.toString(),
            style: TextStyle(
              fontSize: 20,
              color: _secondColor,
            ),
          ),
        ],
      ),
    );
  }

  _taskList() {
    return Column(
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
            thumbColor: _secondColor,
            radius: const Radius.circular(10),
            trackRadius: const Radius.circular(10),
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: widget.employee.tasks.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 40,
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
                          Text(widget.employee.tasks[index].amount.toString()),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
