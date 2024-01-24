import 'dart:convert';
import '../models/info_peliculas.dart';
import 'package:http/http.dart' as http;

class PeliculasService {
  Future<InfoPeliculas> obtenerPeliculasPorGenero(String genero, int pagina) async {
    String myurl = 'proyecto-labo4.onrender.com';      //servidor render
    //String myurl = 'localhost:5000';      //navegador
    //String myurl = '10.0.2.1:5000';       //cel virtual
    //String myurl = '192.168.0.151:5000';    //cel fisico
    Uri url;
    if (genero == '-') {
      url = Uri.http(myurl, '/peliculas/$pagina');
    } else {
      url = Uri.http(myurl, '/peliculas/$pagina', {'genero': genero});
    }

    try {
      final response = await http.get(url);
      print(url);
      print("Entre en el try");

      if (response.statusCode == 200) {
        final dynamic jsonRespuesta = json.decode(response.body);
        InfoPeliculas infoPeliculas = InfoPeliculas.fromJson(jsonRespuesta);
        return infoPeliculas;
      } else {
        throw Exception('Error al obtener películas : ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener películas peliculasService: $e');

      throw Exception('Error al obtener películas: $e');
    }
  }
}
