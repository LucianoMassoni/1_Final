import 'package:flutter/material.dart';
import 'package:flutter_final/themes/default_theme.dart';
import 'package:flutter_final/widgets/portadaPeliculaWidget.dart';
import '../widgets/GenerosDropdownButton.dart';
import '../models/info_peliculas.dart';
import '../service/peliculas_service.dart';


class PantallaPeliculas extends StatefulWidget{
  const PantallaPeliculas ({super.key});

  @override
  State<PantallaPeliculas> createState() => _PantallaPeliculasState();
}

class _PantallaPeliculasState extends State<PantallaPeliculas> {
  final PeliculasService _peliculasService = PeliculasService();
  
  List<Result> peliculas = []; // Asume que tienes una lista de películas

  final ScrollController _scrollController = ScrollController();
  int _paginaActual = 1; 
  String _generoActual = "-";
  final int _desplazamientoMax = 200; 


  @override
  void initState(){
    super.initState();
    _actualizarPeliculas(_generoActual, _paginaActual);
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent - _desplazamientoMax && !_scrollController.position.outOfRange) {
      _cargarMasPeliculas();
    }
  }
  
  void _cargarMasPeliculas() async {
  try {
    _actualizarPeliculas(_generoActual, _paginaActual + 1);
  } catch (error) {
    print('Error al cargar más películas: $error');
  }
}

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  

  void _actualizarPeliculas(String genero, [int pag = 1]) async {
    try {
      InfoPeliculas nuevasPeliculas = await _peliculasService.obtenerPeliculasPorGenero(genero, pag);
      if (genero != _generoActual) {
        peliculas.clear();
      }
      setState(() {
        peliculas.addAll(nuevasPeliculas.results ?? []);
        _paginaActual = pag;
        _generoActual = genero;
      });
    } catch (error) {
      print('Error al obtener películas: $error');

    }
  }
  
  @override
  Widget build(BuildContext context){
    int? idPelicula;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(228, 255, 255, 255),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppThemes.darkTheme().primaryColor,
        // elevation: 0,
        // centerTitle: true,
        actions: <Widget> [
          const Spacer(),
          const Icon(Icons.abc, color: Color.fromARGB(0, 0, 0, 0),),
          const Spacer(),
          Text("Genero:", style: AppThemes.TextColor()),
          GenerosDropdownButton(onGeneroChanged: _actualizarPeliculas),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.account_circle),
            color: AppThemes.darkTheme().indicatorColor,
            onPressed: (){
              Navigator.pushNamed(
                context,
                "perfil"
              );
            }
          ),
          const Spacer(),
        ],
      ),
      body: Container(
        decoration: AppThemes.bodyBackgroundDecoration(),
        child: SafeArea(
          child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo is ScrollEndNotification) {
              double currentScroll = scrollInfo.metrics.pixels;
              double maxScroll = scrollInfo.metrics.maxScrollExtent;

              // Cuando el usuario llega al 80% del final de la lista, carga más películas
              double scrollThreshold = 0.8;

              if (currentScroll / maxScroll > scrollThreshold) {
                
                _cargarMasPeliculas();
              }
            }
            return false;
          },
          child:GestureDetector(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: peliculas.length,
              itemBuilder: (context, index) {
                idPelicula = peliculas[index].id?? null;
                return PortadaPeliculaWidget(
                  id: peliculas[index].id?? -0, 
                  imageUrl: peliculas[index].posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500${peliculas[index].posterPath}'
                    : 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', 
                    
                );
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
        ),
        ),
      )
    );
  }
}

 