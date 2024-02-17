import 'package:flutter/material.dart';
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
      title: Text('Agregar Evento'),
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
              decoration: InputDecoration(labelText: 'Fecha'),
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
              decoration: InputDecoration(labelText: 'Hora de inicio'),
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
              decoration: InputDecoration(labelText: 'Hora final'),
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
            TextField(
              //controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
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
                subject: 'gfh',
                color: Colors.green,
              );

              eventos.add(event);
              Navigator.pop(context);
            }
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
