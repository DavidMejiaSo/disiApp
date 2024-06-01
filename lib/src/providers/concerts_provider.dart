import 'package:disi_app/datasource/Apis/concerts_service.dart';
import 'package:disi_app/datasource/entities/concert.dart';
import 'package:disi_app/src/providers/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final concertList = FutureProvider<List<Concert>>((ref) async {
  final user_token = ref.watch(authProvider).user!.token;
  final concert = await ConcertsService().getAllConcerts(user_token);
  return concert;
});
