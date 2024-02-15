import 'package:riverpod/riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final events_list = StateProvider<List<Appointment>>(
  (ref) {
    return []; //---SUBTOTAL
  },
);

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
