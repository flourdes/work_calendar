import 'package:flutter/material.dart';

class WorkCalendarComponent extends StatefulWidget {
  const WorkCalendarComponent({Key? key}) : super(key: key);

  @override
  State<WorkCalendarComponent> createState() => _WorkCalendarComponentState();
}

class _WorkCalendarComponentState extends State<WorkCalendarComponent> {



  @override
  Widget build(BuildContext context) {
    return _workCalendar();
  }
}


_workCalendar(){
  return AlertDialog(
    insetPadding: EdgeInsets.fromLTRB(5, 200, 5, 200),
    elevation: 0,
    backgroundColor: Colors.teal,
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
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.indigo,
                        )),

                    Expanded(
                        child: Container(
                          height: 200,
                          color: Colors.redAccent,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                color: Colors.cyanAccent,
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                color: Colors.black,
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
