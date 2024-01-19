import 'package:flutter/material.dart';
import '../models/info_pelicula.dart';
import '../service/pelicula_service.dart';



class PantallaPelicula extends StatelessWidget {
  final int? idPelicula;

  const PantallaPelicula({this.idPelicula, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'https://image.tmdb.org/t/p/w500';
    final PeliculaService peliculaService = PeliculaService();

    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<InfoPelicula>(
      future: peliculaService.obtenerInfoPelicula(idPelicula!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Image.asset("assets/loading_poster_blue.gif");
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
            body: SingleChildScrollView(
              child: Container(
                width: screenWidth,
                decoration:const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 4, 9, 37)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child : Stack(
                  children: [
                    Container(                          
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Color.fromARGB(0, 4, 9, 37)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.network(
                        '$imgUrl${infoPelicula.backdropPath}',
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 255, 255, 255)),
                                onPressed: () => Navigator.of(context).pop(),
                                alignment: Alignment.topLeft,
                              ),
                              Flexible(
                                child: Text(
                                '${infoPelicula.title}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                              ),
                              const Icon(Icons.abc, color: Colors.transparent), //un icono transparente para que el spaceBetween quede centrado
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                                child: Hero(
                                  tag: "peli${infoPelicula.id.toString()}",
                                  child: FadeInImage(
                                    placeholder: const AssetImage('assets/loading_poster_blue.gif'),
                                    image: NetworkImage('$imgUrl${infoPelicula.posterPath}'),
                                    width: 200,
                                    height: 500,
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB( 20, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        style: const TextStyle(color: Colors.white),
                                        children: [
                                          const TextSpan(
                                          text: "año: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            //fontSize: 20,
                                          ),
                                        ),
                                        TextSpan(text:'${infoPelicula.releaseDate?.year}')
                                        ]
                                      )
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text.rich(
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          children: [
                                            TextSpan(
                                              text: "Géneros: ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                //fontSize: 20,
                                              ),
                                            ),
                                          ]
                                        )
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          for (var genre in infoPelicula.genres!)
                                            Container(
                                              //constraints: const BoxConstraints(maxWidth: 90), // hardcodeado el width para la pantalla :/ 
                                              child: Text(
                                                genre.name ?? '',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        style: const TextStyle(color: Colors.white),
                                        children: [
                                          const TextSpan(
                                            text: "Rate: ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              //fontSize: 20,
                                            ),
                                          ),
                                          TextSpan(text:'${infoPelicula.voteAverage}')
                                        ]
                                      )
                                    ),
                                  ],
                                ),
                              ),   
                            ],
                          ),  
                        ],
                      ),      
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 550, 0, 0),
                      child: Text.rich(
                        TextSpan(
                          style: const TextStyle(color: Colors.white),
                          children: [
                            const TextSpan(
                              text: "Resumen\n ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(text: '${infoPelicula.overview}' )
                          ],
                        ),
                      ),
                    )
                    //TODO - Un scrollview para los actores?  
                  ],
                ),
              )
            )
          );
        }
      }
    );
  }
}
