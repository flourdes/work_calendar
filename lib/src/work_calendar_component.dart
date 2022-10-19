import 'package:flutter/material.dart';
import 'package:untitled/src/test_calendar.dart';
import 'package:untitled/src/models/task_model.dart';

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
  /////////////////////////////
  _workCalendar(){
    return AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(5, 200, 5, 200),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: (_worckCalendarCard()),
    );
  }

  _worckCalendarCard(){
    return Padding(
      padding: const EdgeInsets.all(0.1) ,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 400,
            color: Colors.white,
            child: Column(
              children: [
                Text("persona"),

                const Divider(
                  color: Colors.grey,
                  thickness: 3,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: TestCalendar(),
                          )),

                      Expanded(
                          child: Container(
                            height: double.infinity,
                            color: Colors.redAccent,
                            child: Column(
                              children: [
                                Expanded(
                                    child: SizedBox.expand(
                                      child: _profits(),
                                    )
                                ),
                                Expanded(
                                    child: SizedBox.expand(
                                      child: taskList(),
                                    )
                                )

                              ],

                            ),
                          ))
                    ],
                  ),
                )
              ],

            ),
          )


      ),
    );
  }


  Widget _profits(){
    late int ganancia = 555;
    late int ganancias = ganancia + 1000;
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          _profitsContainer('Ganancia Diaria:', ganancia),
          const Divider(
            height: 10,
            thickness: 3,
          ),
          _profitsContainer('Ganancia Total:', ganancias),
        ],
      ),
    );
  }
  Widget _profitsContainer(String label, ganancia){
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.w200,)),
              const Expanded(child: SizedBox.shrink()),
              const Icon(Icons.attach_money, size: 10, color: Colors.teal,),
              Text(ganancia.toString(), style: const TextStyle(fontSize: 11, color: Colors.teal,),),
            ],
          ),
        ),
      ),
    );
  }










  /////////////////////

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


/*_workCalendar(){
  return AlertDialog(
    insetPadding: EdgeInsets.fromLTRB(5, 200, 5, 200),
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: (_worckCalendarCard()),
  );
}

_worckCalendarCard(){
  return Padding(
    padding: const EdgeInsets.all(0.1) ,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 400,
          color: Colors.white,
          child: Column(
            children: [
              Text("persona"),

              const Divider(
                color: Colors.grey,
                thickness: 3,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: TestCalendar(),
                        )),

                    Expanded(
                        child: Container(
                          height: double.infinity,
                          color: Colors.redAccent,
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox.expand(
                                  child: _profits(),
                                )
                              ),
                              Expanded(
                                child: SizedBox.expand(
                                  child: taskList(),
                                )
                              )

                            ],

                          ),
                        ))
                  ],
                ),
              )
            ],

          ),
        )


    ),
  );
}


Widget _profits(){
  late int ganancia = 555;
  late int ganancias = ganancia + 1000;
  return Container(
    color: Colors.yellow,
    child: Column(
      children: [
        _profitsContainer('Ganancia Diaria:', ganancia),
        const Divider(
          height: 10,
          thickness: 3,
        ),
        _profitsContainer('Ganancia Total:', ganancias),
      ],
    ),
  );
}
Widget _profitsContainer(String label, ganancia){
  return SizedBox(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.w200,)),
            const Expanded(child: SizedBox.shrink()),
            const Icon(Icons.attach_money, size: 10, color: Colors.teal,),
            Text(ganancia.toString(), style: const TextStyle(fontSize: 11, color: Colors.teal,),),
          ],
        ),
      ),
    ),
  );
}
*/
