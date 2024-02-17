import 'package:disi_app/src/screens/login_page.dart';
import 'package:disi_app/src/screens/profile_page.dart';
import 'package:disi_app/src/screens/prueba_sockets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginPage',
      routes: {
        '/loginPage': (context) => const LoginPage(),
        '/profilePage': (context) => const ProfilePage(),
        '/socket': (context) => const WebSocketDemo()
      },
    );
  }
}
