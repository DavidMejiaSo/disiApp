import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

import '../src/providers/auth_provider.dart';
import '../src/screens/concerts_page.dart';
import '../src/screens/crewPage.dart';
import '../src/screens/login_page.dart';
import '../src/screens/profile_page.dart';
import '../src/screens/prueba_sockets.dart';
import '../src/screens/wall_page.dart';

final goRouterProvider = StateProvider((ref) {
  //final goRouterNotifier = ref.read(goRouterNotifierProvider);
  final user = ref.watch(authProvider); //_------Si hay user o no

  return GoRouter(
    redirectLimit: 100,
    initialLocation: '/loginPage',
    //refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        name: 'login_page',
        path: '/loginPage',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/profilePage',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/concertsPage',
        builder: (context, state) => const ConcertsPage(),
      ),
      GoRoute(
        path: '/crewPage',
        builder: (context, state) => const CrewPage(),
      ),
      GoRoute(
        path: '/wallPage',
        builder: (context, state) => const WallPage(),
      ),
      GoRoute(
        path: '/socket',
        builder: (context, state) => const WebSocketDemo(),
      ),
    ],

    redirect: (context, state) {
      final authStatus = user.authStatus;

      if (authStatus == AuthStatus.notAuthenticated) {
        if (state.fullPath == "/loginPage") return null;
        return '/loginPage';
      }
      if (authStatus == AuthStatus.authenticated) {
        if (state.fullPath == '/loginPage') {
          return '/profilePage';
        }
      }
      return null;
    },
  );
});
