import 'dart:convert';
import '../models/info_pelicula.dart';
import 'package:http/http.dart' as http;


class PeliculaService {
  
  Future<InfoPelicula> obtenerInfoPelicula(int _id) async {
    String id = _id.toString();
    String myurl = 'localhost:5000';
    //String myurl = '10.0.2.1:5000'; 
    Uri url;
      url = Uri.http(myurl, '/pelicula/$id');
      print(url);

    try {
      print(url);
      final response = await http.get(url);
      print("Entre en el try");
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);

      // Mapea la lista de JSON a instancias de la clase Pelicula.
      InfoPelicula infoPelicula = InfoPelicula.fromJson(jsonDecode(response.body));
      return infoPelicula;
      } else {
        throw Exception('Error al obtener películas: ${response.statusCode}');
      }
      
    } catch (e) {
      print('Error al obtener películas: $e');

      throw Exception('Error al obtener películas: $e');
    }
  }
}