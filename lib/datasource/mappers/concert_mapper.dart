import '../entities/concert.dart';

class ConcertMapper {
  static List<Concert> jsonToEntityList(List<dynamic>? json) {
    final List<Concert> concerts = [];

    if (json != null) {
      for (final item in json) {
        final id = item['_id'].toString();
        final eventoName = item['name'] ?? 'Sin nombre';
        final dateTime = DateTime.parse(item['date']);
        final date = dateTime.toLocal().toString().split(' ')[0];
        final hour = dateTime.toLocal().toString().split(' ')[1].split('.')[0];
        final location = item['location'] ?? 'Sin sitio';
        final city = item['city'] ?? 'Sin ciudad';
        final departament = item['state_province'] ?? 'Sin departamento';
        final flyerUrl = item['flyer_url'] ?? '';

        final concert = Concert(
          id: id,
          eventoName: eventoName,
          date: date,
          hour: hour,
          location: location,
          city: city,
          departament: departament,
          flyerUrl: flyerUrl,
        );
        concerts.add(concert);
      }
    }

    return concerts;
  }
}
