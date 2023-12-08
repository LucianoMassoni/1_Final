import 'dart:io';

import 'package:flutter/material.dart';

class PortadaPeliculaWidget extends StatelessWidget {
  const PortadaPeliculaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Hero(
        tag: "peli",
        child: Image(
          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
        )
      ),
      );
  }
}
