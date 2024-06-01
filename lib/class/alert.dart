import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../src/providers/events_provider.dart';

class AddEventState extends ConsumerStatefulWidget {
  const AddEventState({Key? key}) : super(key: key);

  @override
  _AddEventStateState createState() => _AddEventStateState();
}

class _AddEventStateState extends ConsumerState<AddEventState> {
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  @override
  Widget build(BuildContext context) {
    final eventos = ref.watch(events_list);
    return AlertDialog(
      title: const Text('Agregar Evento'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              readOnly: true,
              controller: TextEditingController(
                text: selectedDate != null
                    ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                    : '',
              ),
              decoration: const InputDecoration(labelText: 'Fecha'),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2025),
                );
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
            ),
            TextField(
              readOnly: true,
              controller: TextEditingController(
                text: selectedStartTime != null
                    ? '${selectedStartTime!.hour}:${selectedStartTime!.minute}'
                    : '',
              ),
              decoration: const InputDecoration(labelText: 'Hora de inicio'),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedStartTime = time;
                  });
                }
              },
            ),
            TextField(
              readOnly: true,
              controller: TextEditingController(
                text: selectedEndTime != null
                    ? '${selectedEndTime!.hour}:${selectedEndTime!.minute}'
                    : '',
              ),
              decoration: const InputDecoration(labelText: 'Hora final'),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedEndTime = time;
                  });
                }
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});
            if (selectedDate != null &&
                selectedStartTime != null &&
                selectedEndTime != null) {
              final startTime = DateTime(
                selectedDate!.year,
                selectedDate!.month,
                selectedDate!.day,
                selectedStartTime!.hour,
                selectedStartTime!.minute,
              );
              final endTime = startTime.add(
                Duration(
                  hours: selectedEndTime!.hour - selectedStartTime!.hour,
                  minutes: selectedEndTime!.minute - selectedStartTime!.minute,
                ),
              );

              final event = Appointment(
                startTime: startTime,
                endTime: endTime,
                color: Colors.green,
              );

              eventos.add(event);

              //Ir a siguiente página
              GoRouter.of(context).pop();
              ;
            }
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
