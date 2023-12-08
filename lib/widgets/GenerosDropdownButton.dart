import 'package:flutter/material.dart';

List<String> generos = <String> ["-","Terror", "Drama", "Accion"];

class GenerosDropdownButton extends StatefulWidget {
  const GenerosDropdownButton({super.key});

  @override
  State<GenerosDropdownButton> createState() => _GenerosDropdownButtonState();
}

class _GenerosDropdownButtonState extends State<GenerosDropdownButton> {
  String dropdownValue = generos.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      focusColor: Colors.transparent,
      elevation: 16,
      // style: const TextStyle(color: Colors.deepPurple),
      borderRadius: BorderRadius.circular(20),
      padding: const EdgeInsets.all(10),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          //TODO - Aca poner la llamada a la api??
        });
      },
      items: generos.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
