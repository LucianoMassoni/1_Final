import 'package:flutter/material.dart';
import 'screens/pantallaPeliculas.dart';
import 'screens/pantallaPelicula.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pelis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const pantallaPeliculas(),
        'pelicula': (context) => const PantallaPelicula(),
        //'perfil': (context) => const pantallaPerfil(),
      },
    );
  }
}