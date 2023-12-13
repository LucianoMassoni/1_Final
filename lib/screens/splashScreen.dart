import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushNamed(context, "peliculas");
    }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
          )
        ),
      ),
    );
  }
}

