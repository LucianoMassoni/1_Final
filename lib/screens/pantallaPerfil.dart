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
        /*
        body: SingleChildScrollView(
        child: Column(
           children: [
            HeaderProfile(size: size),          
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: BodyProfile(),
            ),
           ],
        ),
      ),*/
    );
  }
}

/*
class BodyProfile extends StatefulWidget {  

  const BodyProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {    
    final temaProvider = Provider.of<ThemeProvider>(context, listen:false);    
    return Column(
            children: [
              TextFormField(
                onChanged: (value) {                  
                  Preferences.email = value;
                },
                initialValue: Preferences.email,
                style: const TextStyle(
                  color: Color.fromARGB(255, 197, 97, 97),
                ),                       
                keyboardType: TextInputType.emailAddress,
                decoration: decorationInputs(
                  icon:Icons.email, 
                  hintText: 'TExto de prueba',
                  helperText: 'Ej:name@dominio.com'
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(     
                onChanged: (value) {                  
                  Preferences.nombre = value;
                },
                initialValue: Preferences.nombre,
                keyboardType: TextInputType.text,
                decoration: decorationInputs(label: 'Nickname'),
              ),
              const SizedBox(height: 10,),
              TextFormField(     
                onChanged: (value) {                  
                  Preferences.dni = value;
                },
                initialValue: Preferences.dni,
                keyboardType: TextInputType.number,
                decoration: decorationInputs(label: 'DNI'),
              ),
              const SizedBox(height: 15,),   
              SwitchListTile.adaptive(
                title: const Text('Dark Mode'),
                value: Preferences.darkmode, 
                onChanged: (bool value) {                                    
                  setState(() {
                    Preferences.darkmode = value;
                    (value) ? temaProvider.setDark() : temaProvider.setLight();

                  });
                },
              ),                           
            ],
          );
  }

  InputDecoration decorationInputs({IconData? icon, String? hintText, String? helperText, String? label}) {
    return InputDecoration(         
          fillColor: Colors.black,
          label: Text(label ?? ''),
          hintText: hintText,      
          helperStyle: const TextStyle(
            color: Colors.black
          ),      
          helperText: helperText,                          
          prefixIcon: (icon != null) ? Icon(icon):null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1, 
              color: Color(0xff2d3e4f)
            )
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3, 
              color: Color(0xff2d3e4f)
            )
          ),
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2, 
              color: Color(0xff2d3e4f)
            )
          ),
        );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      color: const Color(0xff2d3e4f),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.network('https://cdn2.iconfinder.com/data/icons/flat-style-svg-icons-part-1/512/user_man_male_profile_account-512.png'),
          child: Icon(Icons.supervised_user_circle_sharp, size: 200,)
          child: Image.asset('assets/images/avatar.png'),
        ),
      ),
    );
  }
}

*/
