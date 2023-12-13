import 'package:flutter/material.dart';
import 'package:flutter_final/screens/pantallaPelicula.dart';

class PortadaPeliculaWidget extends StatelessWidget {
  final id;
  final String imageUrl;

  const PortadaPeliculaWidget(
      {required this.id, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PantallaPelicula(idPelicula: id),
            ));
      },
      child: Hero(
          tag: 'peli$id',
          // child:Image.network(
          //   imageUrl,
          //   loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          //     if (loadingProgress == null) {
          //       return child;
          //     } else {
          //       return  const Image(image: AssetImage('../assets/loading_poster.gif'));
          //     }
          //   },
          // ),
          child: FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: Image.asset("assets/loading_poster.gif").image)),
    );
  }
}
