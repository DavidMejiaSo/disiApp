import 'package:riverpod/riverpod.dart';

import '../../datasource/entities/crew.dart';

final UsersList = StateProvider<List<User>>(
  (ref) {
    return [
      User(
        id: '1',
        name: 'Ryner Escobar',
        rol: 'Sonidista', // Cambiado a Sonidista
        photoUrl: '',
        token: '', // Puedes dejarlo vacío o colocar la URL de la foto
      ),
      User(
        id: '2',
        name: 'Daniel Montes',
        rol: 'Fotógrafo', // Cambiado a Fotógrafo
        photoUrl: '', token: '',
      ),
      User(
        id: '3',
        name: 'Alex Calavera',
        rol: 'Sonidista', // Cambiado a Sonidista
        photoUrl: '', token: '',
      ),
      User(
        id: '4',
        name: 'Johan',
        rol: 'Fotógrafo', // Nuevo miembro, Fotógrafo
        photoUrl: '', token: '',
      ),
    ];
  },
);
