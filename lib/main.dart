import 'package:flutter/material.dart';
import 'package:flutter_final/screens/splashScreen.dart';
import 'screens/pantallaPeliculas.dart';
import 'screens/pantallaPelicula.dart';
import 'screens/pantallaPerfil.dart';

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
        'home': (context) =>  const SplashScreen(),
        'peliculas': (context) => const PantallaPeliculas(),
        'pelicula': (context) => const PantallaPelicula(),
        'perfil': (context) => const PantallaPerfil(),
      },
    );
  }
}

