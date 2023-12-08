import 'package:flutter/material.dart';
import 'package:flutter_final/widgets/portadaPeliculaWidget.dart';
import '../widgets/GenerosDropdownButton.dart';



class pantallaPeliculas extends StatelessWidget{
  const pantallaPeliculas ({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(228, 255, 255, 255),
      appBar: AppBar(
        
        // title: const Text("tasdfasdfasdf"),
        // backgroundColor: Color.fromARGB(228, 255, 255, 255),
        // elevation: 0,
        // centerTitle: true,
        actions: <Widget> [
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.home),
            onPressed: (){
              print("home");
              
            }
          ),
          const Spacer(),
          const Text("Genero:"),
          const GenerosDropdownButton(),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.account_circle),
            onPressed: (){
              print("oa");
            }
          ),
          const Spacer(),
        ],

      ),

      body: SafeArea(
        child: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget> [
          ListTile(
              leading: PortadaPeliculaWidget(),
              onTap: () => _gotoPantallaPelicula,
          ),
        
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
          PortadaPeliculaWidget(),
        
        ],
      ),
      )
    );
  }
}

void _gotoPantallaPelicula(BuildContext context){
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (context) => const pantallaPeliculas(),
  )
  );
  
  }