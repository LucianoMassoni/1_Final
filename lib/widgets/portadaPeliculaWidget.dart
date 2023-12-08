import '../screens/pantallaPelicula.dart';
import 'package:flutter/material.dart';

class PortadaPeliculaWidget extends StatelessWidget {
  const PortadaPeliculaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  const PantallaPelicula()
            )
        );
      },
      child: const Hero(
        //TODO - reemplazar el tag por el id de la pelicula. Tanto aca como en pantallaPelicula
        tag: 'peli', 
        child: Image(
          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
        )
      ),
    );
  }
}
