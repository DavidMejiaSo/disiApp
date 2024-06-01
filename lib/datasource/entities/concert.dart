class Concert {
  // Esta es la entidad para los conciertos
  final String id;
  final String eventoName;
  final String date;
  final String hour;
  final String location;
  final String city;
  final String departament;
  final String flyerUrl;

  Concert({
    required this.id,
    required this.eventoName,
    required this.date,
    required this.hour,
    required this.location,
    required this.city,
    required this.departament,
    required this.flyerUrl,
  });
}
