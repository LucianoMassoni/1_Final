import 'package:flutter/material.dart';
import 'package:flutter_final/service/peliculas_relacionadas_service.dart';
import 'package:flutter_final/widgets/RateWidget.dart';
import 'package:flutter_final/widgets/portadaPeliculaWidget.dart';
import '../models/info_pelicula.dart';
import '../models/info_peliculas_relacionadas.dart';
import '../service/pelicula_service.dart';



class PantallaPelicula extends StatelessWidget {
  final int? idPelicula;

  const PantallaPelicula({this.idPelicula, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'https://image.tmdb.org/t/p/w500';
    final PeliculaService peliculaService = PeliculaService();
    



    double screenWidth = MediaQuery.of(context).size.width;

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
                child : Column(
                  children:[
                    Stack(
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
                        padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
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
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Column(
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
                                                Text(
                                                  genre.name ?? '',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Row(
                                        children: [
                                          const Text.rich(
                                            TextSpan(
                                              style: TextStyle(color: Colors.white),
                                              children: [
                                                 TextSpan(
                                                  text: "Rate: ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    //fontSize: 20,
                                                  ),
                                                )
                                              ]
                                            )
                                          ),
                                          RateWidget(rate: infoPelicula.voteAverage ?? 0)
                                        ]
                                      ),
                                      )
                                    ],
                                  ),
                                ),   
                              ],
                            ),  
                          ],
                        ),      
                      )
                    ]
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: AlignmentDirectional.centerStart,
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
                  ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                      alignment: AlignmentDirectional.centerStart,
                      child:const Text.rich(
                        TextSpan(
                          style:  TextStyle(color: Colors.white),
                          children:[
                            TextSpan(
                              text: "Peliculas relacionadas\n ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )
                            )
                          ]
                        )
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                      height: 150,
                      width: 500,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 0, 0, 0)
                      ),
                      child: GestureDetector(
                        child: FutureBuilder<List<Result>>(
                          future: PeliculasRelacionadasService().obtenerInfoPeliculas(idPelicula!),
                          builder: (context, snapshotPeliculasRelacionadas) {
                            if (snapshotPeliculasRelacionadas.hasError) {
                              return Text('Error al obtener películas relacionadas: ${snapshotPeliculasRelacionadas.error}');
                            } else {
                              List<Result> peliculasRelacionadas = snapshotPeliculasRelacionadas.data ?? [];
                              Image.asset("assets/loading_poster_blue.gif");
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: peliculasRelacionadas.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: PortadaPeliculaWidget(
                                      id: peliculasRelacionadas[index].id?? -0, 
                                      imageUrl: peliculasRelacionadas[index].posterPath != null
                                        ? 'https://image.tmdb.org/t/p/w500${peliculasRelacionadas[index].posterPath}'
                                        : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',  
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                        onTap: () async {
                          Navigator.pushNamed(
                            context,
                            'pelicula',
                            arguments: idPelicula,
                          );
                        },  
                      ),
                    )
                    ]
                    
                )
                ),
              )
            );
        }
      }
    );
  }
}
