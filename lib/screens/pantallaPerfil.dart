import 'package:flutter/material.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil ({super.key});

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
          title: const Text("Perfil"),
        ),
        
    );
  }
}