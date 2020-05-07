import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'explorando.dart';
import 'personal.dart';
import 'package:splashscreen/splashscreen.dart';
void main() => runApp(MaterialApp(
  home: imagen(),
));

class imagen extends StatefulWidget {
  @override
  _imagen createState() => new _imagen();
}

class _imagen extends State<imagen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Reconocimiento de Salud',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white),
      ),
      photoSize: 120.0,
      seconds: 5,
      backgroundColor: Colors.black,
      image: Image.network(
        "https://us.123rf.com/450wm/krisdog/krisdog1711/krisdog171100521/90656145-un-personaje-de-dibujos-animados-m%C3%A9dico-sosteniendo-un-tablero-de-clip-y-agitando-.jpg?ver=6",
      ),
      navigateAfterSeconds: new menu(),
    );
  }
}
class menu extends StatefulWidget{
  @override
  _menu createState() => _menu();
}


class _menu extends State<menu>{
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecciona uno"),),
      floatingActionButton: FloatingActionButton(
      onPressed: _optionsDialogBox,
      child: Icon(Icons.image),
    ),);

  }
  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Acceder a Galeria'),
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyApp(exportando: "esperar",)));
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Tomar fotografia'),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyApp(exportando: "tomando",)));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Desarrollador'),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyApp2("Carlos Armando de Jesus Cabrera", "tic 41", "1718110382")));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}