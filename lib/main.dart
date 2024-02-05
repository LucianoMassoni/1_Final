import 'package:flutter/material.dart';
import 'package:flutter_final/screens/barrel.dart';
import 'package:flutter_final/themes/default_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pelis',
      debugShowCheckedModeBanner: false, 
      theme: AppThemes.darkTheme(),
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

