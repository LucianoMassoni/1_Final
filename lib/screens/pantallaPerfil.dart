import 'package:flutter/material.dart';
import 'package:flutter_final/themes/default_theme.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil ({super.key});
  

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppThemes.darkTheme().primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new, 
            color: AppThemes.darkTheme().indicatorColor,
          ),
          onPressed: () => Navigator.of(context).pop()
        ), 
        title: Text.rich(
          TextSpan(
            style: AppThemes.titleTextStyle(),
            text: 'Perfil',
          )
        )
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
        child: Column(
           children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: const Color.fromARGB(78, 23, 33, 88),
                child: Image.asset('assets/perfil.png',),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth/4, 50, screenWidth/4, 0),
              child: TextFormField(
                decoration: AppThemes.textFormFieldDecoration('nombre'),
                style: AppThemes.simpleTextColor(),
                cursorColor: Colors.white,
                
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth/4, 50, screenWidth/4, 0),
              child: TextFormField(
                decoration: AppThemes.textFormFieldDecoration('mail'),
                style: AppThemes.simpleTextColor(),
                cursorColor: Colors.white,
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth/4, 50, screenWidth/4, 0),
              child: TextFormField(
                decoration: AppThemes.textFormFieldDecoration('contraseña'),
                obscureText: true,
                style: AppThemes.simpleTextColor(),
                cursorColor: Colors.white,
                
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth/4, 50, screenWidth/4, 50),
              child: const TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 56, 192, 226)),
                  padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(10, 10, 10, 10))
                ),
                onPressed: null,
                child: Text(
                  'Registrarse', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

