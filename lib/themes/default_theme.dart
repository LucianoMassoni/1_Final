import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor:  const Color.fromARGB(255, 4, 9, 37),
      hintColor:  const Color.fromARGB(255, 46, 52, 87),
      indicatorColor: const Color.fromARGB(232, 255, 255, 255),
      backgroundColor:  const Color.fromARGB(255, 0, 0, 0),
      scaffoldBackgroundColor:  const Color.fromARGB(255, 4, 9, 37),
      iconTheme:  const IconThemeData(color: Colors.white),

      
    );
  }

  static TextStyle TextColor() {
    return  const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle titleTextStyle() {
    return  const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle simpleTextColor(){
    return const TextStyle(
      color: Colors.white,
    );
  }

  static InputDecoration textFormFieldDecoration(String text){
    return InputDecoration(
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      //border: UnderlineInputBorder(),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 56, 192, 226)
        )
      ),
      
      labelText: text,
    );
  }

  static BoxDecoration bodyBackgroundDecoration() {
    return  const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 4, 9, 37),
          Color.fromARGB(255, 0, 0, 0)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}