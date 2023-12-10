import 'package:flutter/material.dart';


class PantallaPelicula extends StatelessWidget {
  const PantallaPelicula({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new, 
              color: Colors.black
            ),
            onPressed: () => Navigator.of(context).pop()
          ), 
          title: const Text("Titulo de la pelicula"),
        ),
        
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: const [
            Hero(
              tag: "peli",
              child: Image(
                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
              )
            ),
          ]
        )
    );
  }
}