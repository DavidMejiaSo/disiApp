import 'package:riverpod/riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//All provides temporales antes de crear el Backend

final events_list = StateProvider<List<Appointment>>(
  (ref) {
    return []; //---SUBTOTAL
  },
);

class MeetingDataSource extends CalendarDataSource {
  //Clase para los appointmens personales
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
