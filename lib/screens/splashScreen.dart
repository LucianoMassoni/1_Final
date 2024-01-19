import 'package:flutter/material.dart';
import 'package:flutter_final/screens/pantallaPeliculas.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    
    Future.delayed(const Duration(seconds: 3), (){
      //Navigator.pushNamed(context, "peliculas");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PantallaPeliculas()));
    }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
          )
        ),
      ),
    );
  }
}

