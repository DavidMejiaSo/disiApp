import 'package:dio/dio.dart';
import 'package:disi_app/datasource/entities/concert.dart';
import 'package:disi_app/datasource/mappers/concert_mapper.dart';

import '../../enviroments/enviroments.dart';

class ConcertsService {
  final dio = Dio(BaseOptions(baseUrl: Enviroment.apiUrl));

  Future<List<Concert>> getAllConcerts(String token) async {
    try {
      final response = await dio.get('/concerts',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final concerts = ConcertMapper.jsonToEntityList(response.data);
      return concerts;
    } catch (e) {
      throw Exception(
          "Algo salió mal ${e.toString()}"); // Devuelve null en caso de error
    }
  }
}
