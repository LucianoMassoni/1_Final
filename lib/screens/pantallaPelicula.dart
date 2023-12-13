import 'package:flutter/material.dart';
import '../models/info_pelicula.dart';
import '../service/pelicula_service.dart';

class PantallaPelicula extends StatelessWidget {
  final int? idPelicula;

  const PantallaPelicula({this.idPelicula, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PeliculaService peliculaService = PeliculaService();

    return FutureBuilder<InfoPelicula>(
        future: peliculaService.obtenerInfoPelicula(idPelicula!),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Image.asset("assets/loading_poster.gif");
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si hay un problema.
            return Text('Error al obtener la película: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            // Muestra un mensaje si no hay datos disponibles.
            return const Text('No se encontró información de la película.');
          } else {
            // Obtiene la información de la película.
            final InfoPelicula infoPelicula = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(infoPelicula.title ?? "Título de la película"),
              ),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Hero(
                    tag: "peli${infoPelicula.id.toString()}",
                    child: FadeInImage(
                      placeholder: AssetImage('../assets/loading_poster.gif'),
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${infoPelicula.posterPath ?? ""}'),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
