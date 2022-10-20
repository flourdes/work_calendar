import 'package:flutter/material.dart';
import 'package:untitled/src/test_calendar.dart';

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
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: Colors.black,
                                ),
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
        Divider(
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
