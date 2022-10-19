import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class WorkCalendarComponent extends StatefulWidget {
  const WorkCalendarComponent({Key? key}) : super(key: key);

  @override
  State<WorkCalendarComponent> createState() => _WorkCalendarComponentState();
}

class _WorkCalendarComponentState extends State<WorkCalendarComponent> {
  late int ganancia = 555;
  late int ganancias = ganancia + 1000;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.grey.shade200,
          ),
        ),
        Expanded(child: Center(child: _profits())),
      ],
    );
  }

  Widget _profits(){
    return Expanded(
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            _profitsContainer('Ganancia diaria:', ganancia),
            const SizedBox(height: 20,),
            _profitsContainer('Ganancia total:', ganancias),
          ],
        ),
      ),
    );
  }
  Widget _profitsContainer(String label, ganancia){
    return Container(
      padding: const EdgeInsets.all(10),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 20, color: Colors.black),),
          const Expanded(child: SizedBox.shrink()),
          const Icon(Icons.attach_money, size: 20, color: Colors.teal,),
          Text(ganancia.toString(), style: const TextStyle(fontSize: 20, color: Colors.teal, decoration: TextDecoration.none),),
        ],
      ),
    );
  }

}
