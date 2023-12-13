import 'package:flutter/material.dart';

List<String> generos = <String> ["-","Terror", "Drama", "Accion"];


class GenerosDropdownButton extends StatefulWidget {
  final Function(String) onGeneroChanged;
  const GenerosDropdownButton({required this.onGeneroChanged});

  @override
  State<GenerosDropdownButton> createState() => _GenerosDropdownButtonState();
}


class _GenerosDropdownButtonState extends State<GenerosDropdownButton> {
  String dropdownValue = generos.first;

  void _handleGeneroChanged(String newGenero) {
  setState(() {
    dropdownValue = newGenero;
  });

  widget.onGeneroChanged(dropdownValue);
  }

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
        _handleGeneroChanged(value!);
      },
      items: generos.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList()
      );
      }
  }

