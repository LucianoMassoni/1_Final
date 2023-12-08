import 'package:flutter/material.dart';


class PantallaPelicula extends StatelessWidget {
  const PantallaPelicula({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
        ),
        body: Hero(
        tag: "peli",
        child: Image(
          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
        )
        ),
    );
  }
}