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
            return 
            Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(infoPelicula.title ?? "Título de la película"),
              ),
              body:
              
              Container(
                color: Color.fromARGB(255, 80, 80, 80),
                child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500${infoPelicula.backdropPath?? ""}'),
                        opacity: 0.5,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 160, 0, 0),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            Text(infoPelicula.title ?? "Título de la película"),
                          ],
                        ),
                        Row(
                          children: [
                            Hero(
                              tag: "peli${infoPelicula.id.toString()}",
                              child: FadeInImage(
                                placeholder: const AssetImage('../assets/loading_poster.gif'),
                                image: NetworkImage('https://image.tmdb.org/t/p/w500${infoPelicula.posterPath ?? ""}'),
                                width: 100,
                                height: 250,
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white ),
                      children:[
                        const TextSpan(
                          text: "Resumen\n", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 20
                          ),
                        ),
                        TextSpan(text: infoPelicula.overview?? '', ),
                      ]
                    )
                          
                  ),
                        
                  Container(
                    child: Text(infoPelicula.overview?? ''), //TODO - generos
                  ),
                  Container(
                    child: Text(''), //TODO - votes - aca en vez de poner eso puedo hacer un widget cicular de los votos.
                  ),
                  
                ],
              )
              )
            );
          }
        });
  }
}
