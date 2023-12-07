import 'package:flutter/material.dart';
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

      body: ListView(
        prototypeItem: const Padding(padding: EdgeInsets.all(16.0)),
        
        children: [
          Ink(
            color: Colors.lime[50],
            child: const ListTile(
              title: Text("asdfasf"),
              textColor: Color.fromARGB(255, 49, 255, 169)
            ),
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            ),
          const ListTile(
            title: Text("asdfasf"),
            textColor: Color.fromARGB(255, 49, 255, 169)
            )
        ],
      ),
    );
  }
}
